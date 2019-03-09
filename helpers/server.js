const request      = require("request");
const moment       = require('moment');
const PostOnServer = require('../models/PostOnServer');
// const serverHost   = 'http://localhost:8000';
const serverHost   = 'http://isolution.io/demo/yadgar';
const time2Sync    = 2.5;
let holdSync       = time2Sync * 60;

class ServerJs {
    constructor(type) {
        const server = this;
        holdSync     = time2Sync * 60;
        console.log('Posted', moment().format('HH:mm:ss'));

        if (window.navigator.onLine == true) {
            this.isOnline().then(function () {
                if (type == 1) {
                    server.getUpdatedLocalTables();
                }
                if (type == 2) {
                    server.getUpdatedServerTables();
                }
            });
        }
    }

    isOnline() {
        return new Promise(function (release, reject) {
            request({uri: 'https://www.google.com', method: 'GET', agent: false}, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    release(1);
                } else {
                    reject(1);
                }
            });
        });
    }

    getUpdatedLocalTables() {
        ServerJs.startPostingOnServer('users').then(function () {
            ServerJs.startPostingOnServer('accounts').then(function () {
                ServerJs.startPostingOnServer('documents').then(function () {
                    ServerJs.startPostingOnServer('cartage').then(function () {
                        ServerJs.startPostingOnServer('general').then(function () {
                            ServerJs.startPostingOnServer('profits').then(function () {
                                ServerJs.startPostingOnServer('ledger').then(function () {
                                    ServerJs.startPostingOnServer('sales').then(function () {
                                        ServerJs.startPostingOnServer('purchases').then(function () {
                                            console.log('Pushed on Server', moment().format('HH:mm:ss'))
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    }

    getUpdatedServerTables() {
        PostOnServer.getLastSyncTime().then(function (result) {
            const time = result[0].value;
            ServerJs.startReceiving4rmServer('users', time).then(function () {
                ServerJs.startReceiving4rmServer('accounts', time).then(function () {
                    ServerJs.startReceiving4rmServer('documents', time).then(function () {
                        ServerJs.startReceiving4rmServer('cartage', time).then(function () {
                            ServerJs.startReceiving4rmServer('general', time).then(function () {
                                ServerJs.startReceiving4rmServer('profits', time).then(function () {
                                    ServerJs.startReceiving4rmServer('ledger', time).then(function () {
                                        ServerJs.startReceiving4rmServer('sales', time).then(function () {
                                            ServerJs.startReceiving4rmServer('purchases', time).then(function () {
                                                console.log('Received from Server', moment().format('HH:mm:ss'));

                                                // update on database
                                                PostOnServer.setLastSyncTime(moment()).then(function () {
                                                    // update on document as well
                                                    PostOnServer.setLastSyncTimeOnDocument();
                                                });

                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        })
    }

    static async startPostingOnServer(table) {
        return await PostOnServer.getChangedRows(table).then(function (results) {
            if (results.length > 0) {
                return ServerJs.send2server(table, results);
            }
            return true;
        });
    }

    static async send2server(table, result) {
        return new Promise(function (release, reject) {
            request({
                uri: serverHost + '/api/post/table',
                method: 'POST',
                form: {
                    table: table,
                    rows: result
                },
            }, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    let rows = JSON.parse(body);
                    PostOnServer.updateChangedRows(table, rows[table]);
                    release(1);
                } else {
                    console.log(error, response, body);
                    release(1);
                }
            });
        });
    }

    static async startReceiving4rmServer(table, time, page) {
        page = page || 1;
        return new Promise(function (release, reject) {
            request({
                uri: serverHost + '/api/get/table',
                method: 'POST',
                form: {
                    table: table,
                    time: time,
                    page: page
                },
            }, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    let rows = JSON.parse(body);

                    if (rows.data.length > 0) {

                        Array.prototype.forEach.call(rows.data, (row, i) => {
                            PostOnServer.isRowExist(table, row.id).then(function (result) {
                                if (result.length > 0) {
                                    // if row is not changed then update the row
                                    if (result[0].is_changed == 0) {
                                        PostOnServer.updateRow(table, row);
                                    }
                                } else {
                                    PostOnServer.createRow(table, row);
                                }

                                if (++i == rows.data.length) {
                                    // Get by pagination
                                    if (rows.current_page != rows.last_page) {
                                        ServerJs.startReceiving4rmServer(table, time, ++rows.current_page).then(function () {
                                            release(1);
                                        })
                                    } else {
                                        release(1);
                                    }
                                }
                            });
                        });

                    } else {
                        release(1);
                    }

                } else {
                    console.log(error, response, body);
                    if (table == 'purchases') {
                        reject(1);
                    } else {
                        release(1);
                    }
                }
            });
        });
    }
}

const table = document.getElementById('status_system_information').children[0];
function updateClock() {
    holdSync--;
    table.children[3].children[1].innerHTML = moment().add(holdSync, 'seconds').fromNow();
}

updateClock();
setInterval(updateClock, 1000);

// Push on server
window.setInterval(function () {
    new ServerJs(1);

    // Pull from Server after 1 min delay
    setTimeout(function () {
        new ServerJs(2);
    }, 60000);
}, (time2Sync * 60000));