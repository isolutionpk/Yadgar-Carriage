const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const PostOnServer = {
    /**
     * Get change row to post on server
     * @param table
     * @returns {Promise.<*>}
     */
    getChangedRows: async function (table) {
        return await query('SELECT * FROM `' + table + '` WHERE `is_changed` = 1');
    },

    /**
     * Get change row to post on server
     * @param table
     * @param ids
     * @returns {Promise.<*>}
     */
    updateChangedRows: async function (table, ids) {
        return await query("UPDATE `" + table + "` SET `is_changed` = 0 WHERE `id` IN (?)", [ids]);
    },

    /**
     * Get change row to post on server
     * @param table
     * @param id
     * @returns {Promise.<*>}
     */
    isRowExist: async function (table, id) {
        return await query("SELECT * FROM `" + table + "` WHERE `id` = '" + id + "'");
    },

    /**
     * Get change row to post on server
     * @param table
     * @param row
     * @returns {Promise.<*>}
     */
    updateRow: async function (table, row) {
        delete row.server_id;
        delete row.posted_at;
        return await query("UPDATE `" + table + "` SET ? WHERE `id` = ? AND `is_changed` = 0", [row, row.id]);
    },

    /**
     * Get change row to post on server
     * @param table
     * @param row
     * @returns {Promise.<*>}
     */
    createRow: async function (table, row) {
        delete row.server_id;
        delete row.posted_at;
        row.is_changed = 0;
        return await query("INSERT INTO `" + table + "` SET ?", row);
    },

    /**
     * Get Last Sync Time
     * @returns {Promise.<*>}
     */
    getLastSyncTime: async function () {
        return await query("SELECT `value` FROM `settings` WHERE `name` = 'last_server_sync'");
    },

    /**
     * Get Last Sync Time
     * @returns {Promise.<*>}
     */
    setLastSyncTime: async function ($time) {
        $time.subtract(1, 'minutes');
        $time = $time.format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `settings` SET `value` = ? WHERE `name` = 'last_server_sync'", $time);
    },

    /**
     * Get Last Sync Time
     * @returns {Promise.<*>}
     */
    setLastSyncTimeOnDocument: async function () {
        const system = document.getElementById('status_system_information');
        const table  = system.children[0];

        this.getLastSyncTime().then(function (result) {
            const time                              = result[0].value;
            table.children[4].children[1].innerHTML = moment(time).fromNow();
        });
    }
}


module.exports = PostOnServer
