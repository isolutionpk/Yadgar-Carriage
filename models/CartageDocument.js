const connection = require('../config/db_connection');
const util       = require('util');
const moment     = require('moment');
const machine    = require('node-machine-id');
const settings   = require('electron-settings');
const query      = util.promisify(connection.query).bind(connection);

const CartageDocument = {

    /**
     * Get Unique Key
     * @returns {Promise.<*>}
     */
    getUniqueKey: async function () {
        let time        = moment().format('YYYYMMDDHHmmssx');
        let random      = Math.floor((Math.random() * 100000) + 1);
        let id          = 'DOCUMENT' + machine.machineIdSync() + time + random;
        let resultExist = query("SELECT `id` FROM `documents` WHERE `id` = '" + id + "'");
        let cl          = this;
        return await resultExist.then((result) => {
            if (result.length > 0) {
                return cl.getUniqueKey();
            }
            return id;
        });
    },

    /**
     * Get Cartage Documents list against the given dates
     * @returns {Promise.<*>}
     */
    getDocuments: async function () {
        return await query("SELECT * FROM `documents` WHERE `deleted_at` IS NULL ORDER BY `created_at`");
    },

    /**
     * Create Cartage Documents
     * @param data
     * @returns {Promise.<*>}
     */
    createDocuments: async function (data) {
        const d = this;
        return await this.getUniqueKey().then(function (id) {
            data             = d.updateDates(data);
            const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
            const created_at = moment().format('YYYY-MM-DD HH:mm:ss');
            const user_id    = settings.get('loggedUser').id;
            return query("INSERT INTO `documents`(`id`, `reg_no`, `passing`, `dip_chart`, `route`, `token`, `insurance`, `explosive`, `tracker`, `created_by`, `created_at`, `updated_at`) " +
                         "VALUES('" + id + "', '" + reg_no + "', '" + data['passing'] + "', '" + data['dip_chart'] + "', '" + data['route'] + "', " +
                         "'" + data['token'] + "', '" + data['insurance'] + "', '" + data['explosive'] + "', " +
                         "'" + data['tracker'] + "', '" + user_id + "', '" + created_at + "', '" + created_at + "')");
        });
    },

    /**
     * Create Cartage Documents
     * @param data
     * @returns {Promise.<*>}
     */
    updateDocuments: async function (data) {
        data             = this.updateDates(data);
        const reg_no     = data['reg_no'].replace(/'/g, "\\'").toUpperCase();
        const updated_at = moment().format('YYYY-MM-DD HH:mm:ss');
        return await query("UPDATE `documents` SET " +
                           "`reg_no`       = '" + reg_no + "', " +
                           "`passing`      = '" + data['passing'] + "', " +
                           "`dip_chart`    = '" + data['dip_chart'] + "', " +
                           "`route`        = '" + data['route'] + "', " +
                           "`token`        = '" + data['token'] + "', " +
                           "`insurance`    = '" + data['insurance'] + "', " +
                           "`explosive`    = '" + data['explosive'] + "', " +
                           "`tracker`      = '" + data['tracker'] + "', " +
                           "`is_changed`   = 1, " +
                           "`updated_at`   = '" + updated_at + "' WHERE `id`  = '" + data['id'] + "'");
    },

    /**
     * Update Dates as per database
     * @param data
     * @returns {*}
     */
    updateDates: function (data) {
        for (const row in data) {
            if (data.hasOwnProperty(row)) {
                if (!['reg_no', 'id'].includes(row)) {
                    data[row] = moment(data[row], 'DD-MM-YYYY').format('YYYY-MM-DD');
                }
            }
        }
        return data;
    },

    /**
     * Check if date is Valid
     * @param data
     * @returns {boolean}
     */
    isValidDates: function (data) {
        let isValid = true;
        for (const row in data) {
            if (data.hasOwnProperty(row)) {
                if (!['reg_no', 'id'].includes(row) && !moment(data[row], 'DD-MM-YYYY', true).isValid() && data[row] != '') {
                    showToast(row.replace('_', ' ').ucwords() + ' not valid (DD-MM-YYYY) date', 'danger')
                    isValid = false;
                }
            }
            if (!isValid) {
                break;
            }
        }
        return isValid;
    }
}


module.exports = CartageDocument
