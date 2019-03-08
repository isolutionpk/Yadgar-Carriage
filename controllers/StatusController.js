const moment       = require('moment');
const mysqldump    = require('mysqldump');
const machine      = require('node-machine-id');
const Dashboard    = require('../models/Dashboard');
const PostOnServer = require('../models/PostOnServer');
const dbName       = 'yadgar';

class StatusController {
    constructor() {
        this.downloadBackup()
        StatusController.systemStatus()
        StatusController.pushNotificationOnce()
    }

    init() {
        showLoader();
        this.databaseStatus();

        PostOnServer.setLastSyncTimeOnDocument();
    }

    databaseStatus() {
        Dashboard.getChangedRows().then(function (results) {
            let html = '';
            Array.prototype.forEach.call(results, (row) => {
                html += StatusController.getProgressBar(row.table, row.total, row.updated);
            });

            const database = document.getElementById('status_database_table');
            if (html == '') {
                database.innerHTML = '<p class="text-center"><strong>Local data Upto date on Server</strong></p>';
            } else {
                database.innerHTML = html;
            }

            // Init Data Table
            hideLoader()
        })
    }

    downloadBackup() {
        const download = document.getElementById('download-backup-file');
        download.addEventListener('click', function () {
            showLoader();

            mysqldump({
                connection: {
                    host: 'localhost',
                    user: 'root',
                    password: '',
                    database: dbName
                }
            }).then(function (dump) {
                let FileSaver = require('file-saver');
                let blob      = new Blob([dump.dump.schema, '\n', dump.dump.data], {type: "text/plain;charset=utf-8"});
                FileSaver.saveAs(blob, moment().format('YYYY-MM-DD') + " backup yadgar.sql");
            })

            hideLoader();
        });
    }

    static systemStatus() {
        const system = document.getElementById('status_system_information');
        const table  = system.children[0];

        function updateClock() {
            table.children[2].children[1].innerHTML = moment().format('YYYY-MM-DD hh:mm:ss a');
        }

        updateClock();
        setInterval(updateClock, 1000);

        table.children[1].children[1].innerHTML = machine.machineIdSync({original: true});
        //table.children[3].children[1].innerHTML = moment().fromNow();
        table.children[4].children[1].innerHTML = moment().fromNow();
    }

    static getProgressBar(table, total, updated) {
        if (parseInt(total) !== 0 && parseInt(updated) !== 0) {
            const percentage = (100 * parseInt(updated)) / parseInt(total);
            const color      = (percentage > 80) ? 'red' : ((percentage > 60) ? 'aqua' : ((percentage > 40) ? 'yellow' : 'green'));
            return '<div class="progress-group">' +
                   '<span class="progress-text">' + table + '</span>' +
                   '<span class="progress-number"><b>' + parseInt(updated) + '</b>/' + parseInt(total) + '</span>' +
                   '<div class="progress sm">' +
                   '<div class="progress-bar progress-bar-' + color + '" style="width: ' + percentage + '%"></div>' +
                   '</div></div>';
        }
        return '';
    }

    static pushNotificationOnce() {
        Dashboard.getExpireDocuments().then(function (results) {
            let html = '';
            Array.prototype.forEach.call(results, (row) => {
                html += StatusController.getExpDocs(row.passing, row.reg_no + ' Passing');
                html += StatusController.getExpDocs(row.dip_chart, row.reg_no + ' Dip Chart');
                html += StatusController.getExpDocs(row.route, row.reg_no + ' Route');
                html += StatusController.getExpDocs(row.token, row.reg_no + ' Token');
                html += StatusController.getExpDocs(row.insurance, row.reg_no + ' Insurance');
                html += StatusController.getExpDocs(row.explosive, row.reg_no + ' Explosive Licence');
                html += StatusController.getExpDocs(row.tracker, row.reg_no + ' Tracker Certificate');
            });

            if (html != '') {
                new Notification('Documents Near to Expire', {
                    body: html
                });
            }
        })
    }

    static getExpDocs(date, document) {
        if (moment(date).isValid()) {
            const diff = moment(date).diff(moment(), 'days');
            if (diff <= 31) {
                return document + ' document expire in ' + diff + ' days' + "\n";
            }
        }
        return '';
    }
}

module.exports = StatusController