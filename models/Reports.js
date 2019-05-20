const connection = require('../config/db_connection');
const util       = require('util');
const serialize  = require('node-serialize');
const moment     = require('moment');
const query      = util.promisify(connection.query).bind(connection);

const Reports = {

    getReports: async function (account, chartsOfAccounts) {
        let type = 0, query_string = '';
        if (isset(chartsOfAccounts[account])) {
            type = chartsOfAccounts[account].type;
        }

        // Customer
        if (type == 1) {
            query_string = this.getCreditLedgerQuery(account) + 'UNION ' +
                           this.getDebitLedgerQuery(account) + 'UNION ' +
                           this.getCustomerQuery(account) + 'UNION ' +
                           this.getGeneralQuery(account) +
                           "ORDER BY DATE(`created_at`), FIELD(`table`, 'ledger', 'general', 'sales')";
            // Supplier
        } else if (type == 2) {
            query_string = this.getDebitLedgerQuery(account) + 'UNION ' +
                           this.getCreditLedgerQuery(account) + 'UNION ' +
                           this.getSupplierQuery(account) + 'UNION ' +
                           this.getGeneralQuery(account) +
                           "ORDER BY DATE(`created_at`), FIELD(`table`, 'ledger', 'general', 'purchases')";
            // Product
        } else if (type == 5) {
            query_string = this.getPurchaseProductQuery(account) + 'UNION ' +
                           this.getSaleProductQuery(account) + 'UNION ' +
                           this.getGeneralQuery(account) + 'ORDER BY `created_at`';

        } else if (type == 8 || type == 9 || type == 10) {
            query_string = this.getCartageQuery(account) + 'UNION ' +
                           this.getGeneralQuery(account) + 'ORDER BY `created_at`';

        } else {
            query_string = this.getCreditLedgerQuery(account) + 'UNION ' +
                           this.getDebitLedgerQuery(account) + 'UNION ' +
                           this.getGeneralQuery(account) + 'ORDER BY `created_at`';
        }

        return await query(query_string);
    },

    getSupplierReports: async function (account, date) {
        date = date.format('YYYY-MM-DD');
        return await query('SELECT `accounts`.`ac_id`, `accounts`.`name`, `description`, `total` AS `debit` ' +
                           'FROM `ledger` LEFT JOIN `accounts` ON `ledger`.`credit` = `accounts`.`id` ' +
                           "WHERE `ledger`.`deleted_at` IS NULL AND `debit` = '" + account + "' " +
                           "AND DATE(`ledger`.`created_at`) = '" + date + "' ORDER BY `ledger`.`created_at`");
    },

    getProfitAndLossReports: async function () {
        return await query("SELECT `profits`.`created_at`, `description`, `debit`, `credit`, `ac_id`, `name` " +
                           'FROM `profits` LEFT JOIN `accounts` ON `profits`.`account` = `accounts`.`id` ' +
                           "WHERE `profits`.`deleted_at` IS NULL ORDER BY `profits`.`created_at`");
    },

    getVehicleReports: async function (type) {
        if (type == 2) {
            return await query("SELECT `sales`.`created_at`, `ac1`.`ac_id` AS `product`, `quantity`, `price`, " +
                               "`total`, `ac2`.`ac_id` AS `terminal`, `reg_no` FROM `sales` " +
                               'LEFT JOIN `accounts` AS `ac1` ON `sales`.`product` = `ac1`.`id` ' +
                               'LEFT JOIN `accounts` AS `ac2` ON `sales`.`customer` = `ac2`.`id` ' +
                               "WHERE `sales`.`deleted_at` IS NULL ORDER BY `sales`.`created_at`");
        } else {
            return await query("SELECT `purchases`.`created_at`, `ac1`.`ac_id` AS `product`, `quantity`, `price`, " +
                               "`total`, `ac2`.`ac_id` AS `terminal`, `reg_no` FROM `purchases` " +
                               'LEFT JOIN `accounts` AS `ac1` ON `purchases`.`product` = `ac1`.`id` ' +
                               'LEFT JOIN `accounts` AS `ac2` ON `purchases`.`terminal` = `ac2`.`id` ' +
                               "WHERE `purchases`.`deleted_at` IS NULL ORDER BY `purchases`.`created_at`");
        }
    },

    /**
     * Get Ledger Query
     * @param account
     * @returns string
     */
    getCreditLedgerQuery: function (account) {
        return "SELECT `ledger`.`created_at`, CONCAT('To ', `accounts`.`ac_id`, ' ', `description`) AS `description`, " +
               "'0' AS `debit`, `total` AS `credit`, 'ledger' AS `table` FROM `ledger` " +
               "LEFT JOIN `accounts` ON `ledger`.`debit`  = `accounts`.`id` " +
               "WHERE `ledger`.`deleted_at` IS NULL AND `credit` = '" + account + "' ";
    },

    /**
     * Get Ledger Query
     * @param account
     * @returns string
     */
    getDebitLedgerQuery: function (account) {
        return "SELECT `ledger`.`created_at`, CONCAT('FROM ', `accounts`.`ac_id`, ' ', `description`) AS `description`, " +
               "`total` AS `debit`, '0' AS `credit`, 'ledger' AS `table` FROM `ledger` " +
               "LEFT JOIN `accounts` ON `ledger`.`credit`  = `accounts`.`id` " +
               "WHERE `ledger`.`deleted_at` IS NULL AND `debit` = '" + account + "' ";
    },

    /**
     * Get Supplier Query
     * @param account
     * @returns string
     */
    getSupplierQuery: function (account) {
        return "SELECT `purchases`.`created_at`, CONCAT('Purchase ', `accounts`.`ac_id`,  ' ', `quantity`, ' @ ', `price`, ' Veh ', `reg_no`) AS `description`, " +
               " '0' AS `debit`, `total` AS `credit`, 'purchases' AS `table` " +
               "FROM `purchases` LEFT JOIN `accounts` ON `purchases`.`product`  = `accounts`.`id` " +
               "WHERE `purchases`.`deleted_at` IS NULL AND `supplier` = '" + account + "' ";
    },

    /**
     * Get Supplier Query
     * @param account
     * @returns string
     */
    getCustomerQuery: function (account) {
        return "SELECT `sales`.`created_at`, CONCAT('Supply of ', `accounts`.`ac_id`,  ' ', `quantity`, ' @ ', `price`, ' Veh ', `reg_no`) AS `description`, " +
               " `total` AS `debit`, '0' AS `credit`, 'sales' AS `table` " +
               "FROM `sales` LEFT JOIN `accounts` ON `sales`.`product`  = `accounts`.`id` " +
               "WHERE `sales`.`deleted_at` IS NULL AND `customer` = '" + account + "' ";
    },

    /**
     * Get Supplier Query
     * @param account
     * @returns string
     */
    getPurchaseProductQuery: function (account) {
        return "SELECT `purchases`.`created_at`, CONCAT('Purchase of ', `quantity`, ' @ ', `price`, ' From ', `accounts`.`ac_id`) AS `description`, " +
               " `total` AS `debit`, '0' AS `credit`, 'purchases' AS `table` " +
               "FROM `purchases` LEFT JOIN `accounts` ON `purchases`.`supplier`  = `accounts`.`id` " +
               "WHERE `purchases`.`deleted_at` IS NULL AND `product` = '" + account + "' ";
    },

    /**
     * Get Supplier Query
     * @param account
     * @returns string
     */
    getSaleProductQuery: function (account) {
        return "SELECT `sales`.`created_at`, CONCAT('Sale of ',  `quantity`, ' @ ', `price`, ' To ', `accounts`.`ac_id`) AS `description`, " +
               " '0' AS `debit`, `total` AS `credit`, 'sales' AS `table` " +
               "FROM `sales` LEFT JOIN `accounts` ON `sales`.`customer`  = `accounts`.`id` " +
               "WHERE `sales`.`deleted_at` IS NULL AND `product` = '" + account + "' ";
    },

    /**
     * Get Purchase Query
     * @param account
     * @returns string
     */
    getCartageQuery: function (account) {
        return "SELECT `cartage`.`created_at`, CONCAT('Lorry ', `ac`.`ac_id`,  ' ', `led`.`ac_id`, ' (', `description`, ')') AS `description`, " +
               " `debit`, `credit`, 'cartage' AS `table` " +
               "FROM `cartage` LEFT JOIN `accounts` AS `ac` ON `cartage`.`account`  = `ac`.`id` " +
               "LEFT JOIN `accounts` AS `led` ON `cartage`.`ledger`  = `led`.`id` " +
               "WHERE `cartage`.`deleted_at` IS NULL " +
               "AND `account` = '" + account + "' OR `ledger` = '" + account + "' ";
    },

    /**
     * Get General Query
     * @param account
     * @returns string
     */
    getGeneralQuery: function (account) {
        return "SELECT `created_at`, `description`, `debit`, `credit`, 'general' AS `table` FROM `general` " +
               "WHERE `general`.`deleted_at` IS NULL AND `account` = '" + account + "' ";
    }
}


module.exports = Reports
