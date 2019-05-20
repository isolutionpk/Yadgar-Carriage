const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const Ledger = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'LEDGER' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `ledger` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Ledgers list against the given dates
     * @param start
     * @param end
     * @returns {Promise.<*>}
     */
    getLedgers: async function (start, end) {
        start = moment(start, 'DD/MM/YYYY').format('YYYY-MM-DD');
        end   = moment(end, 'DD/MM/YYYY').format('YYYY-MM-DD');
        return await query("SELECT * FROM `ledger`  WHERE `deleted_at` IS NULL " +
                           "AND DATE(`created_at`) >= '" + start + "' AND DATE(`created_at`) <= '" + end + "' " +
                           "ORDER BY `created_at`");
    },

    /**
     * Create Ledger
     * @param data
     * @param created
     * @returns {Promise.<*>}
     */
    createLedger: async function (data, created) {
        return await this.getUniqueKey().then(function (id) {
            let created_at = moment();
            if (created.value.trim() !== '' && created.value !== created_at.format('DD/MM/YYYY')) {
                created_at = moment(created.value + ' 22:00:00', 'DD/MM/YYYY HH:mm:ss')
            }
            created_at       = created_at.format('YYYY-MM-DD HH:mm:ss');
            const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
            const user_id    = settings.get('loggedUser').id;
            return query("INSERT INTO `ledger`(`id`, `credit`, `total`, `debit`, `description`, `created_by`, `created_at`, `updated_at`) " +
                         "VALUES('" + id + "', '" + data['credit'] + "', '" + data['total'] + "', '" + data['debit'] + "', " +
                         "'" + data['description'].replace(/'/g, "\\'") + "', '" + user_id + "', '" + created_at + "', '" + updated_at + "')");
        });
    },

    /**
     * Create Ledger
     * @param data
     * @returns {Promise.<*>}
     */
    updateLedger: async function (data) {
        const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `ledger` SET `credit` = '" + data['credit'] + "', " +
                           "`total`     = '" + data['total'] + "', " +
                           "`debit`  = '" + data['debit'] + "', " +
                           "`description`  = '" + data['description'].replace(/'/g, "\\'") + "', " +
                           "`is_changed`    = 1, " +
                           "`updated_at`= '" + updated_at + "' WHERE `id`  = '" + data['id'] + "'");
    }
}


module.exports = Ledger
