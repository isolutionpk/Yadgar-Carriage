const mysql      = require('mysql');
const moment     = require('moment');
const fs         = require('fs');
const mysqldump  = require('mysqldump');
const dbName     = 'yadgar';
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: ''
});


function displayDatabaseSection(type) {
    const login   = document.getElementById('login-section')
    const section = document.getElementById('database-section')
    if (section) {
        login.classList.remove('is-shown')
        section.classList.add('is-shown')
        document.querySelector('body > .wrapper').classList.add('hide')
        document.querySelector('body').className = 'hold-transition login-page'
        document.getElementById('loader').classList.remove('show')

        if (type == 1) {
            const con = document.getElementById('connection-not-found')
            const db  = document.getElementById('database-not-found')

            con.classList.add('hide')
            db.classList.remove('hide')

            createDbListener()
            uploadSqlListener()
        }
    }
}

function createDb(path) {

    showLoader();

    new Promise(function (release, reject) {
        let dbQuery = fs.readFileSync(path).toString()
            .split('\n')
            .filter(function (line) {
                return line.indexOf('#') != 0;
            })
            .join('')
            .replace(/(\r\n|\n|\r)/gm, " ") // remove newlines
            .replace(/\s+/g, ' ') // excess white space
            .split(";") // split into all statements
            .map(Function.prototype.call, String.prototype.trim)
            .filter(function (el) {
                return el.length != 0
            }); // remove any empty ones;

        dbQuery.forEach(function (query, i) {
            connection.query(query, function (err, result) {
                if (err) {
                    hideLoader();

                    showToast('Something are wrong in the backup file', 'danger');

                    reject(1);
                    throw err;
                } else if (++i == dbQuery.length) {
                    release(1);
                }
            });
        });
    }).then(function (result) {
        window.location.reload();
    });
}

function createDbListener() {
    const db = document.getElementById('create-database');
    db.addEventListener('click', function () {
        if (confirm('Are you sure want to create empty database')) {
            const path = __dirname + '/yadgar.sql';
            createDb(path);
        }
    });
}

function uploadSqlListener() {
    const file = document.getElementById('sql-file-import');
    const db   = document.getElementById('sql-file-import-btn');
    db.addEventListener('click', function () {

        if (file.files.length <= 0) {
            showToast('Please select backup file', 'danger');
            return false;
        }

        const path = file.files[0].path;
        createDb(path);
    });
}

// node native promisify
connection.connect(function (err) {
    if (err) {
        displayDatabaseSection(0);
        return false;
    }

    connection.query('CREATE DATABASE IF NOT EXISTS ' + dbName);
    connection.changeUser({database: dbName}, function (err) {
        if (err) {
            displayDatabaseSection(1);
            console.log('Database not found!');
            return false;
        }

        connection.query('SELECT 1 FROM users LIMIT 1', function (err, result) {
            if (err) {
                displayDatabaseSection(1);
                console.log('Database Tables not found!');
                return false;
            }
        });
    });

    console.log("Connected!");
});

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'localhost',
    user: 'root',
    password: '',
    database: dbName
})

pool.getConnection((err, connection) => {
    if (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.log('Database connection was closed.')
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.log('Database has too many connections.')
        }
        if (err.code === 'ECONNREFUSED') {
            console.log('Database connection was refused.')
        }
    }
    if (connection) connection.release()
    return false;
})

module.exports = pool