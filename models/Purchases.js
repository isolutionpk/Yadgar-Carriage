const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const Purchases = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'PURCHASE' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `purchases` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Purchases list against the given dates
     * @param start
     * @param end
     * @returns {Promise.<*>}
     */
    getPurchases: async function (start, end) {
        start = moment(start, 'DD/MM/YYYY').format('YYYY-MM-DD');
        end   = moment(end, 'DD/MM/YYYY').format('YYYY-MM-DD');
        return await query("SELECT * FROM `purchases` WHERE `deleted_at` IS NULL " +
                           "AND DATE(`created_at`) >= '" + start + "' AND DATE(`created_at`) <= '" + end + "' " +
                           "ORDER BY `created_at`");
    },

    /**
     * Create Purchases
     * @param data
     * @param created
     * @returns {Promise.<*>}
     */
    createPurchases: async function (data, created) {
        return await this.getUniqueKey().then(function (id) {
            let created_at = moment();
            if (created.value.trim() !== '' && created.value !== created_at.format('DD/MM/YYYY')) {
                created_at = moment(created.value + ' 22:00:00', 'DD/MM/YYYY HH:mm:ss')
            }
            created_at       = created_at.format('YYYY-MM-DD HH:mm:ss');
            const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
            const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
            const user_id    = settings.get('loggedUser').id;
            return query("INSERT INTO `purchases`(`id`, `product`, `quantity`, `price`, `total`, `supplier`, `terminal`, `reg_no`, `created_by`, `created_at`, `updated_at`) " +
                         "VALUES('" + id + "', '" + data['product'] + "', '" + data['quantity'] + "', '" + data['price'] + "', " +
                         "'" + data['total'] + "', '" + data['supplier'] + "', '" + data['terminal'] + "', " +
                         "'" + reg_no + "', '" + user_id + "', '" + created_at + "', '" + updated_at + "')");
        });
    },

    /**
     * Create Purchases
     * @param data
     * @returns {Promise.<*>}
     */
    updatePurchases: async function (data) {
        const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
        const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `purchases` SET `product` = '" + data['product'] + "', " +
                           "`quantity`   = '" + data['quantity'] + "', " +
                           "`price`      = '" + data['price'] + "', " +
                           "`total`      = '" + data['total'] + "', " +
                           "`supplier`   = '" + data['supplier'] + "', " +
                           "`terminal`   = '" + data['terminal'] + "', " +
                           "`reg_no`     = '" + reg_no + "', " +
                           "`is_changed` = 1, " +
                           "`updated_at` = '" + updated_at + "' WHERE `id` = '" + data['id'] + "'");
    }
}


module.exports = Purchases
