const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const Sales = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'SALES' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `sales` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Sales list against the given dates
     * @param start
     * @param end
     * @returns {Promise.<*>}
     */
    getSales: async function (start, end) {
        start = moment(start, 'DD/MM/YYYY').format('YYYY-MM-DD');
        end   = moment(end, 'DD/MM/YYYY').format('YYYY-MM-DD');
        return await query("SELECT * FROM `sales` WHERE `deleted_at` IS NULL " +
                           "AND DATE(`created_at`) >= '" + start + "' AND DATE(`created_at`) <= '" + end + "' " +
                           "ORDER BY `created_at`");
    },

    /**
     * Create Sales
     * @param data
     * @param created
     * @returns {Promise.<*>}
     */
    createSales: async function (data, created) {
        return await this.getUniqueKey().then(function (id) {
            let created_at = moment();
            if (created.value.trim() !== '' && created.value !== created_at.format('DD/MM/YYYY')) {
                created_at = moment(created.value + ' 22:00:00', 'DD/MM/YYYY HH:mm:ss')
            }
            created_at       = created_at.format('YYYY-MM-DD HH:mm:ss');
            const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
            const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
            const user_id    = settings.get('loggedUser').id;
            return query("INSERT INTO `sales`(`id`, `product`, `quantity`, `price`, `total`, `customer`, `description`, `reg_no`, `created_by`, `created_at`, `updated_at`) " +
                         "VALUES('" + id + "', '" + data['product'] + "', '" + data['quantity'] + "', '" + data['price'] + "', " +
                         "'" + data['total'] + "', '" + data['customer'] + "', '" + data['description'].replace(/'/g, "\\'") + "', " +
                         "'" + reg_no + "', '" + user_id + "', '" + created_at + "', '" + updated_at + "')");
        });
    },

    /**
     * Create Sales
     * @param data
     * @returns {Promise.<*>}
     */
    updateSales: async function (data) {
        const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
        const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `sales` SET `product` = '" + data['product'] + "', " +
                           "`quantity`      = '" + data['quantity'] + "', " +
                           "`price`         = '" + data['price'] + "', " +
                           "`total`         = '" + data['total'] + "', " +
                           "`customer`      = '" + data['customer'] + "', " +
                           "`description`   = '" + data['description'].replace(/'/g, "\\'") + "', " +
                           "`reg_no`        = '" + reg_no + "', " +
                           "`is_changed`    = 1, " +
                           "`updated_at`    = '" + updated_at + "' WHERE `id` = '" + data['id'] + "'");
    }
}


module.exports = Sales
