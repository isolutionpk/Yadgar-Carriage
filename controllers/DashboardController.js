const moment        = require('moment');
const Dashboard     = require('../models/Dashboard');
const number_format = require('../helpers/number_format');
const remote        = require('electron').remote;

class DashboardController {
    constructor(elementId) {
        showLoader();
        this.index()
    }

    index() {
        this.stockLeft();
        this.documents();
        this.profitAndLoss();
    }

    stockLeft() {
        const tableId = '#dashboard_stock_left';
        Dashboard.getProductLeft().then(function (results) {
            let dataSet = [], reSort = [];

            // Merge Same product values
            Array.prototype.forEach.call(results, (row) => {
                if (isset(reSort[row.product])) {
                    reSort[row.product] = {
                        'ac_id': row.ac_id,
                        'name': row.name,
                        'purchase': parseFloat(reSort[row.product].purchase) + parseFloat(row.purchase),
                        'sale': parseFloat(reSort[row.product].sale) + parseFloat(row.sale)
                    }
                } else {
                    reSort[row.product] = {
                        'ac_id': row.ac_id,
                        'name': row.name,
                        'purchase': row.purchase,
                        'sale': row.sale
                    }
                }
            })

            // Loop to make an array for displaying
            for (const k in reSort) {
                if (reSort.hasOwnProperty(k)) {
                    const row = reSort[k];
                    dataSet.push([
                        row.ac_id,
                        row.name,
                        number_format(row.purchase, 0),
                        number_format(row.sale, 0),
                        number_format(row.purchase - row.sale, 0)
                    ]);
                }
            }

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, ['A/C id', 'Product', 'Purchase', 'Sale', 'Remaining']);
            hideLoader()
        })
    }

    documents() {
        Dashboard.getExpireDocuments().then(function (results) {
            let html = '';
            Array.prototype.forEach.call(results, (row) => {
                html += DashboardController.getProgressBar(row.passing, row.reg_no + ' Passing', 'red');
                html += DashboardController.getProgressBar(row.dip_chart, row.reg_no + ' Dip Chart', 'aqua');
                html += DashboardController.getProgressBar(row.route, row.reg_no + ' Route', 'green');
                html += DashboardController.getProgressBar(row.token, row.reg_no + ' Token', 'yellow');
                html += DashboardController.getProgressBar(row.insurance, row.reg_no + ' Insurance', 'red');
                html += DashboardController.getProgressBar(row.explosive, row.reg_no + ' Explosive Licence', 'aqua');
                html += DashboardController.getProgressBar(row.tracker, row.reg_no + ' Tracker Certificate', 'green');
            });

            const documentsBox = document.getElementById('dashboard_expire_documents_box');
            const documents    = document.getElementById('dashboard_expire_documents');
            if (html != '') {
                documentsBox.removeAttribute('style');
                documents.innerHTML = html;
            } else {
                documentsBox.style.display = 'none';
            }

            // Init Data Table
            hideLoader()
        })
    }

    profitAndLoss() {
        document.getElementById('daily-profit-chart').innerHTML   = '';
        document.getElementById('monthly-profit-chart').innerHTML = '';
        document.getElementById('yearly-profit-chart').innerHTML  = '';

        Dashboard.getDailyProfits().then(function (results) {
            const JSONString = JSON.stringify(results)
            let chart        = DashboardController.MorrisLineChart('daily-profit-chart', JSONString, 'oDay', 'orders', 'Profit Rs');
            DashboardController.listenerOnTab4Redraw('daily-profit-chart-tab', chart)
        })
        Dashboard.getMonthlyProfits().then(function (results) {
            const JSONString = JSON.stringify(results)
            let chart        = DashboardController.MorrisLineChart('monthly-profit-chart', JSONString, 'oMonth', 'orders', 'Profit Rs');
            DashboardController.listenerOnTab4Redraw('monthly-profit-chart-tab', chart)
        })
        Dashboard.getYearlyProfits().then(function (results) {
            const JSONString = JSON.stringify(results)
            let chart        = DashboardController.MorrisLineChart('yearly-profit-chart', JSONString, 'oYear', 'orders', 'Profit Rs');
            DashboardController.listenerOnTab4Redraw('yearly-profit-chart-tab', chart)
        })
    }

    static MorrisLineChart(element, object, xKey, yKey, label) {
        object = JSON.parse(object.replace(/&quot;/g, '"'));
        return new Morris.Line({
            element: element,
            resize: true,
            redraw: true,
            parseTime: false,
            data: object,
            xkey: xKey,
            ykeys: [yKey],
            labels: [label],
            lineWidth: 2,
            hideHover: 'auto',
            gridStrokeWidth: 0.4,
            pointSize: 4,
            pointStrokeColors: ["#efefef"],
            gridLineColor: "#efefef",
            gridTextFamily: "Open Sans",
            gridTextSize: 10
        });
    }

    static listenerOnTab4Redraw(id, chart) {
        let tab = document.getElementById(id)
        tab.addEventListener('click', function (event) {
            chart.redraw();
            let sizes = remote.getCurrentWindow().getSize();
            remote.getCurrentWindow().setSize(sizes[0] + 1, sizes[1]);
            remote.getCurrentWindow().setSize(sizes[0], sizes[1]);
        });
    }

    static getProgressBar(date, document, color) {
        if (moment(date).isValid()) {
            const diff = moment(date).diff(moment(), 'days');
            if (diff <= 31) {
                const percentage = (100 * diff) / 31;
                return '<div class="progress-group">' +
                       '<span class="progress-text">' + document + '</span>' +
                       '<span class="progress-number"><b>' + diff + '</b>/days left</span>' +
                       '<div class="progress sm">' +
                       '<div class="progress-bar progress-bar-' + color + '" style="width: ' + percentage + '%"></div>' +
                       '</div></div>';
            }
        }
        return '';
    }
}

module.exports = DashboardController