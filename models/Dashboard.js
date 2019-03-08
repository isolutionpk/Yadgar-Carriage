const connection = require('../config/db_connection');
const util       = require('util');
const query      = util.promisify(connection.query).bind(connection);

const Dashboard = {

    getProductLeft: async function () {
        return await query("SELECT `accounts`.`ac_id`, `accounts`.`name`, `purchases`.`product`, " +
                           "SUM(`purchases`.`quantity`) AS `purchase`, " +
                           "SUM(`sales`.`quantity`) AS `sale`, " +
                           "SUM(`purchases`.`quantity`) - SUM(`sales`.`quantity`) AS `remaining` " +
                           "FROM `purchases` LEFT JOIN `sales` ON `sales`.`product` = `purchases`.`product` " +
                           "LEFT JOIN `accounts` ON `accounts`.`id`  = `purchases`.`product` " +
                           "WHERE `purchases`.`deleted_at` IS NULL " +
                           "AND `sales`.`deleted_at` IS NULL " +
                           "GROUP BY `purchases`.`product`, `sales`.`product`");
    },

    getExpireDocuments: async function () {
        return await query("SELECT * FROM `documents` WHERE `deleted_at` IS NULL AND (" +
                           "DATE(`passing`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`dip_chart`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`route`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`token`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`insurance`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`explosive`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH) " +
                           "OR DATE(`tracker`) <= DATE_ADD(DATE(NOW()) , INTERVAL 1 MONTH)" +
                           ")");
    },


    getDailyProfits: async function () {
        return await query("SELECT DATE_FORMAT(`days`.`day`, '%d %b') AS `oDay`, (SUM(`debit`) - SUM(`credit`)) AS `orders` " +
                           'FROM (SELECT curdate() as `day` ' +
                           'UNION SELECT curdate() - INTERVAL 1 day ' +
                           'UNION SELECT curdate() - INTERVAL 2 day ' +
                           'UNION SELECT curdate() - INTERVAL 3 day ' +
                           'UNION SELECT curdate() - INTERVAL 4 day ' +
                           'UNION SELECT curdate() - INTERVAL 5 day ' +
                           'UNION SELECT curdate() - INTERVAL 6 day ' +
                           'UNION SELECT curdate() - INTERVAL 7 day ' +
                           'UNION SELECT curdate() - INTERVAL 8 day ' +
                           'UNION SELECT curdate() - INTERVAL 9 day) `days` ' +
                           "LEFT JOIN `profits` ON `days`.`day` = DATE(`profits`.`created_at`) " +
                           "WHERE `deleted_at` IS NULL " +
                           "GROUP BY `days`.`day`");
    },

    getMonthlyProfits: async function () {
        return await query("SELECT DATE_FORMAT(`months`.`oMon`, '%b %y') AS `oMonth`, (SUM(`debit`) - SUM(`credit`)) AS `orders` " +
                           'FROM (SELECT curdate() as `oMon` ' +
                           'UNION SELECT curdate() - INTERVAL 1 month ' +
                           'UNION SELECT curdate() - INTERVAL 2 month ' +
                           'UNION SELECT curdate() - INTERVAL 3 month ' +
                           'UNION SELECT curdate() - INTERVAL 4 month ' +
                           'UNION SELECT curdate() - INTERVAL 5 month ' +
                           'UNION SELECT curdate() - INTERVAL 6 month ' +
                           'UNION SELECT curdate() - INTERVAL 7 month ' +
                           'UNION SELECT curdate() - INTERVAL 8 month ' +
                           'UNION SELECT curdate() - INTERVAL 9 month) `months` ' +
                           "LEFT JOIN `profits` ON LAST_DAY(`months`.`oMon`) = LAST_DAY(`profits`.`created_at`) " +
                           "WHERE `deleted_at` IS NULL " +
                           "GROUP BY `months`.`oMon`");
    },

    getYearlyProfits: async function () {
        return await query("SELECT YEAR(`created_at`) AS `oYear`, (SUM(`debit`) - SUM(`credit`)) AS `orders` " +
                           "FROM `profits` WHERE `deleted_at` IS NULL " +
                           "GROUP BY YEAR(`created_at`) ORDER BY YEAR(`created_at`) LIMIT 10");
    },

    getChangedRows: async function () {
        return await query("SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Purchases' AS `table` FROM `purchases`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Sales' AS `table` FROM `sales`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Debit/Credit' AS `table` FROM `ledger`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'General' AS `table` FROM `general`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Profits and Loss' AS `table` FROM `profits`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Vehicle Billing' AS `table` FROM `cartage`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Vehicle Documents' AS `table` FROM `documents`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Charts of Accounts' AS `table` FROM `accounts`" +
                           " UNION " +
                           "SELECT COUNT(`id`) AS `total`, SUM(CASE WHEN `is_changed` = '1' THEN 1 ELSE 0 END) `updated`, 'Users' AS `table` FROM `users`");
    }
}


module.exports = Dashboard
