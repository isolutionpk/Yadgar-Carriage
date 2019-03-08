const connection = require('../config/db_connection');
const util       = require('util');
const serialize  = require('node-serialize');
const moment     = require('moment');
const machine    = require('node-machine-id');
const query      = util.promisify(connection.query).bind(connection);

const User = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'USER' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `users` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Users
     * @returns {Promise.<*>}
     */
    getUsers: async function () {
        return await query('SELECT * FROM `users` WHERE `deleted_at` IS NULL');
    },

    /**
     * Get Specific User
     * @param id
     * @returns {Promise.<*>}
     */
    getUser: async function (id) {
        return await query("SELECT * FROM `users` WHERE `deleted_at` IS NULL AND `id` = '" + id + "' LIMIT 1");
    },

    /**
     * Checking if User name Exist
     * @param username
     * @param id
     * @returns {Promise.<*>}
     */
    isUserNameExist: async function (username, id) {
        let where = (id !== 0) ? " AND `id` != '" + id + "' " : '';
        return await query("SELECT * FROM `users` WHERE `deleted_at` IS NULL " +
                           "AND `user_name` = '" + username + "' " + where + " LIMIT 1");
    },


    /**
     * Checking if User is valid
     * @param username
     * @param password
     * @returns {Promise.<*>}
     */
    isUserValid: async function (username, password) {
        return await query("SELECT * FROM `users` WHERE `deleted_at` IS NULL AND " +
                           "`user_name` = '" + username + "' AND `password` = MD5('" + password + "') LIMIT 1");
    },

    /**
     * Update User
     * @param data
     * @returns {Promise.<*>}
     */
    updateUser: async function (data) {
        const updated_at  = moment().format('YYYY-MM-DD HH:mm:ss');
        const permissions = isset(data['permissions']) ? "`permissions` = '" + serialize.serialize(data['permissions']) + "', " : '';
        const password    = (data['password'] != '') ? "`password` = MD5('" + data['password'] + "'), " : '';
        return await query("UPDATE `users` SET " +
                           "`name` = '" + data['name'] + "', " +
                           "`user_name` = '" + data['user_name'] + "', " + password + permissions +
                           "`is_changed` = 1, " +
                           "`updated_at` = '" + updated_at + "' " +
                           "WHERE `id` = '" + data['id'] + "'");
    },

    /**
     * Create User
     * @param data
     * @returns {Promise.<*>}
     */
    createUser: async function (data) {
        return await this.getUniqueKey().then(function (id) {
            const created_at  = moment().format('YYYY-MM-DD HH:mm:ss');
            const permissions = serialize.serialize(data['permissions']);
            return query("INSERT INTO `users`(`id`, `name`, `user_name`, `password`, `role`, `permissions`, `created_at`, `updated_at`) " +
                         "VALUES('" + id + "', '" + data['name'] + "', '" + data['user_name'] + "', MD5('" + data['password'] + "'), " +
                         "MD5('user'), '" + permissions + "', '" + created_at + "', '" + created_at + "')");
        });
    },

    /**
     * Delete User
     * @param id
     * @returns {Promise.<*>}
     */
    deleteUser: async function (id) {
        const deleted_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `users` SET `deleted_at` = '" + deleted_at + "', `is_changed` = 1, " +
                           "`updated_at` = '" + deleted_at + "' WHERE `id` = '" + id + "'");
    }
}


module.exports = User
