const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const Accounts = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'ACCOUNT' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `accounts` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Accounts by given types
     * @param types
     * @returns {Promise.<*>}
     */
    getAccounts: async function (types) {
        types       = types || [];
        types       = Array.isArray(types) ? types : [types];
        const where = (types.length) ? ' AND `type` IN(' + types.join(',') + ') ' : '';
        return await query('SELECT * FROM `accounts` WHERE `deleted_at` IS NULL ' + where + ' ORDER BY `ac_id` ASC');
    },

    /**
     * Get All accounts
     * @returns {Promise.<*>}
     */
    getAllAccounts: async function () {
        return await query('SELECT * FROM `accounts` WHERE `deleted_at` IS NULL ORDER BY `ac_id` ASC');
    },

    /**
     * Get Specific User
     * @param id
     * @returns {Promise.<*>}
     */
    getAccount: async function (id) {
        return await query("SELECT * FROM `accounts` WHERE `deleted_at` IS NULL AND `id` = '" + id + "' LIMIT 1");
    },

    /**
     * todo: needs to ask to Hassan about this
     * Checking if Account id Exist
     * @param accountId
     * @param id
     * @returns {Promise.<*>}
     */
    isAccountIdExist: async function (accountId, id) {
        accountId = accountId.toUpperCase();
        let where = (id !== 0) ? " AND `id` != '" + id + "' " : '';
        return await query("SELECT * FROM `accounts` WHERE `deleted_at` IS NULL " +
                           "AND `ac_id` = '" + accountId + "' " + where + " LIMIT 1");
    },

    /**
     * Update User
     * @param data
     * @returns {Promise.<*>}
     */
    updateAccount: async function (data) {
        const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `accounts` SET " +
                           "`ac_id` = '" + data['ac_id'] + "', " +
                           "`name` = '" + data['name'] + "', " +
                           "`address` = '" + data['address'] + "', " +
                           "`city` = '" + data['city'] + "', " +
                           "`phone_1` = '" + data['phone_1'] + "', " +
                           "`phone_2` = '" + data['phone_2'] + "', " +
                           "`email` = '" + data['email'] + "', " +
                           "`website` = '" + data['website'] + "', " +
                           "`type` = '" + data['type'] + "', " +
                           "`is_changed` = 1, " +
                           "`updated_at` = '" + updated_at + "' " +
                           "WHERE `id` = '" + data['id'] + "'");
    },

    /**
     * Create Accounts
     * @param data
     * @returns {Promise.<*>}
     */
    createAccount: async function (data) {
        return await this.getUniqueKey().then(function (id) {
            const ac_id      = data['ac_id'].toUpperCase();
            const created_at = moment().format('YYYY-MM-DD HH:mm:ss');
            const user_id    = settings.get('loggedUser').id;
            return query("INSERT INTO `accounts`(`id`, `ac_id`, `name`, `address`, `city`, `phone_1`, `phone_2`, `email`, `website`,  `type`, `created_at`, `updated_at`, `created_by`) " +
                         "VALUES('" + id + "', '" + ac_id + "', '" + data['name'] + "', '" + data['address'] + "', " +
                         "'" + data['city'] + "', '" + data['phone_1'] + "', '" + data['phone_2'] + "', " +
                         "'" + data['email'] + "', '" + data['website'] + "', '" + data['type'] + "', " +
                         "'" + created_at + "', '" + created_at + "', '" + user_id + "')");
        });
    },

    /**
     * Delete User
     * @param id
     * @returns {Promise.<*>}
     */
    isAccountUsed: async function (id) {
        const purchases = "SELECT `id` FROM `purchases` WHERE (`product` = '" + id + "' OR `supplier` = '" + id + "' OR `terminal` = '" + id + "') AND `deleted_at` IS NULL";
        const sales     = "SELECT `id` FROM `sales` WHERE (`product` = '" + id + "' OR `customer` = '" + id + "') AND `deleted_at` IS NULL";
        const profits   = "SELECT `id` FROM `profits` WHERE `account` = '" + id + "' AND `deleted_at` IS NULL";
        const ledger    = "SELECT `id` FROM `ledger` WHERE (`credit` = '" + id + "' OR `debit` = '" + id + "') AND `deleted_at` IS NULL";
        const general   = "SELECT `id` FROM `general` WHERE `account` = '" + id + "' AND `deleted_at` IS NULL";
        const cartage   = "SELECT `id` FROM `cartage` WHERE (`account` = '" + id + "' OR `ledger` = '" + id + "') AND `deleted_at` IS NULL";
        return await query(purchases + ' UNION ' + sales + ' UNION ' + profits + ' UNION ' + ledger + ' UNION ' + general + ' UNION ' + cartage);
    },

    /**
     * Delete User
     * @param id
     * @returns {Promise.<*>}
     */
    deleteAccount: async function (id) {
        const deleted_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `accounts` SET `deleted_at` = '" + deleted_at + "', `is_changed` = 1, " +
                           "`updated_at` = '" + deleted_at + "' WHERE `id` = '" + id + "'");
    },

    /**
     * Delete Row
     * @param table
     * @param id
     * @returns {Promise.<*>}
     */
    deleteRow: async function (table, id) {
        const deleted_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `" + table + "` SET `deleted_at` = '" + deleted_at + "', `is_changed` = 1, " +
                           "`updated_at` = '" + deleted_at + "' WHERE `id` = '" + id + "'");
    }
}


module.exports = Accounts
