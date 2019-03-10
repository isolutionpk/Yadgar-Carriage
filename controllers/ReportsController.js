const Reports       = require('../models/Reports');
const Accounts      = require('../models/Accounts');
const jsPDF         = require('jspdf');
const XLSX          = require('xlsx');
const FileSaver     = require('file-saver');
const request       = require("request");
const moment        = require('moment');
const machine       = require('node-machine-id');
const number_format = require('../helpers/number_format');
const shell         = require('electron').shell
// const serverHost    = 'http://localhost:8000';
const serverHost    = 'http://isolution.io/demo/yadgar';
require('jspdf-autotable');

class ReportsController {

    constructor() {
        ReportsController.chartsOfAccounts = [];
        ReportsController.index(ReportsController.chartsOfAccounts);
        ReportsController.suppliers(ReportsController.chartsOfAccounts);
        ReportsController.profitAndLoss();
        ReportsController.vehicle();
    }

    init() {
        showLoader();
        ReportsController.getSelect2Option(ReportsController.chartsOfAccounts)
    }


    /**
     * Default report account base
     * @param chartsOfAccounts
     */
    static index(chartsOfAccounts) {
        let account = document.getElementById('reports-form-account');
        let start   = document.getElementById('report-start-date');
        let end     = document.getElementById('report-end-date');

        let buttons = [
            {type: 'show', id: 'show_report'},
            {type: 'pdf', id: 'download_report_pdf'},
            {type: 'xsl', id: 'download_report_xsl'},
            {type: 'wpdf', id: 'whats_app_report_pdf'},
            {type: 'wxsl', id: 'whats_app_report_xsl'}
        ];

        Array.prototype.forEach.call(buttons, (button) => {
            let btnEle = document.getElementById(button.id);
            btnEle.addEventListener('click', function () {
                if (!account.value) {
                    showToast('Please select Account ID.', 'danger');
                    return false;
                }
                ReportsController.getRecord(account, start, end, chartsOfAccounts, button.type);
            });
        });
    }

    static getRecord(account, start, end, chartsOfAccounts, type) {
        const tableId   = '#reports_list';
        let startReport = start.value;
        let endReport   = end.value;

        showLoader()
        Reports.getReports(account.value, chartsOfAccounts).then(function (results) {
            let sNo = 1, dataSet = [], dates = [], total = 0;

            Array.prototype.forEach.call(results, (row) => {
                dates.push(row.created_at);
            })

            if (startReport == '') {
                startReport = isset(dates[0]) ? moment(dates[0]) : ''
            } else {
                startReport = moment(startReport, 'DD/MM/YYYY');
            }
            if (endReport == '') {
                let last  = dates.length - 1;
                endReport = isset(dates[last]) ? moment(dates[last]) : ''
            } else {
                endReport = moment(endReport, 'DD/MM/YYYY');
            }

            let $isHeader = true;
            Array.prototype.forEach.call(results, (row) => {

                let created = moment(row.created_at).format('YYYY-MM-DD');
                if (startReport.format('YYYY-MM-DD') <= created && endReport.format('YYYY-MM-DD') >= created) {
                    if ($isHeader) {
                        let hDis = (total >= 0) ? 'Dr' : 'Cr';
                        dataSet.push(['', '', 'B/F', '', '', number_format(total, 2) + ' ' + hDis]);
                        $isHeader = false;
                    }
                }

                total = parseFloat(total) - parseFloat(row.credit);
                total = parseFloat(total) + parseFloat(row.debit);

                if (startReport.format('YYYY-MM-DD') <= created && endReport.format('YYYY-MM-DD') >= created) {
                    let aDis = (total >= 0) ? 'Dr' : 'Cr';
                    dataSet.push([
                        sNo,
                        moment(row.created_at).format('DD-MM-YYYY'),
                        row.description,
                        number_format(row.debit, 2),
                        number_format(row.credit, 2),
                        number_format(total, 2) + ' ' + aDis
                    ]);
                    sNo++;
                }
            })

            // If result not found
            if (dataSet.length <= 0) {
                showToast('Sorry! Result not found.', 'danger');
                return false;
            }

            // Init Data Table
            const headings = ['No', 'Date', 'Description', 'Debit', 'Credit', 'Total'];
            HtmlHelper.initDataTable(tableId, dataSet, headings);

            let selAccount;
            if (isset(chartsOfAccounts[account.value])) {
                selAccount = chartsOfAccounts[account.value];
            }

            startReport = startReport.format('DD-MM-YYYY');
            endReport   = endReport.format('DD-MM-YYYY');
            if (type == 'pdf' || type == 'wpdf') {
                ReportsController.generatePDF(headings, dataSet, startReport, endReport, selAccount, type);
            } else if (type == 'xsl' || type == 'wxsl') {
                ReportsController.generateXSL(1, headings, dataSet, selAccount, type);
            } else {
                const info                             = document.getElementById('report-information');
                info.querySelector('.a').innerHTML     = selAccount.ac_id
                info.querySelector('.n').innerHTML     = selAccount.name
                info.querySelector('.t').innerHTML     = getChartOfAccountsLabels(selAccount.type)
                info.querySelector('.print').innerHTML = moment().format('DD-MM-YYYY')
                info.querySelector('.from').innerHTML  = startReport
                info.querySelector('.to').innerHTML    = endReport

                hideLoader()
                window.$('#modal-default').modal('show')
            }
        })
    }

    static generatePDF(headings, dataSet, start, end, selAccount, type) {
        const doc = new jsPDF();
        headings  = headings.map(x => (x.title));

        let img = new Image();
        img.src = './assets/img/logo.png';
        doc.addImage(img, 'PNG', 15, 10);

        const inWidth = doc.internal.pageSize.width;

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text(15, 40, 'A/C ID:');
        doc.text((inWidth - 65), 40, 'Print on:');
        doc.setFontType('normal');
        doc.text(40, 40, selAccount.ac_id);
        doc.text((inWidth - 35), 40, moment().format('DD-MM-YYYY'));

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text(15, 45, 'Name:');
        doc.text((inWidth - 65), 45, 'From:');
        doc.setFontType('normal');
        doc.text(40, 45, selAccount.name);
        doc.text((inWidth - 35), 45, start);

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text(15, 50, 'Type:');
        doc.text((inWidth - 65), 50, 'To:');
        doc.setFontType('normal');
        doc.text(40, 50, getChartOfAccountsLabels(selAccount.type));
        doc.text((inWidth - 35), 50, end);

        doc.autoTable({
            margin: {top: 35},
            head: [headings],
            body: dataSet,
            columnStyles: {
                0: {halign: 'center', minCellWidth: 10},
                1: {halign: 'center', minCellWidth: 20},
                3: {minCellWidth: 25},
                4: {minCellWidth: 25},
                5: {minCellWidth: 30}
            },
            headStyles: {fillColor: '#00a65a', fontSize: 10},
            bodyStyles: {fontSize: 8}
        });

        if (type == 'wpdf') {
            let blob = doc.output('datauristring');
            ReportsController.send2server('pdf', blob).then(function (url) {
                hideLoader()
                url = "https://wa.me/?text=" + url;
                shell.openExternal(url)
            });
        } else {
            hideLoader()
            doc.save(moment().format('YYYY-MM-DD') + ' ' + selAccount.name + '.pdf');
        }
    }


    /**
     * Get Suppliers Reports Section Start
     * @param chartsOfAccounts
     */
    static suppliers(chartsOfAccounts) {
        let supplierDate    = document.getElementById('supplier-report-date');
        let supplierAccount = document.getElementById('supplier-reports-form-account');

        if (supplierDate.value.trim() === '') {
            supplierDate.value = moment().format('DD/MM/YYYY');
        }

        let buttons = [
            {type: 'show', id: 'show_supplier_report'},
            {type: 'pdf', id: 'download_supplier_report_pdf'},
            {type: 'xsl', id: 'download_supplier_report_xsl'},
            {type: 'wpdf', id: 'whats_app_supplier_report_pdf'},
            {type: 'wxsl', id: 'whats_app_supplier_report_xsl'}
        ];

        Array.prototype.forEach.call(buttons, (button) => {
            const btnEle = document.getElementById(button.id);
            btnEle.addEventListener('click', function () {
                if (!supplierDate.value) {
                    showToast('Please Select date.', 'danger');
                    return false;
                }
                if (!supplierAccount.value) {
                    showToast('Please select Account ID.', 'danger');
                    return false;
                }
                ReportsController.getSupplierRecord(supplierAccount, supplierDate, chartsOfAccounts, button.type);
            });
        });
    }

    static getSupplierRecord(account, day, chartsOfAccounts, type) {
        const tableId   = '#supplier_reports_list';
        let dayOfReport = moment(day.value, 'DD/MM/YYYY');

        Reports.getSupplierReports(account.value, dayOfReport).then(function (results) {
            let sNo = 1, dataSet = [], total = 0;

            Array.prototype.forEach.call(results, (row) => {
                total = parseFloat(total) + parseFloat(row.debit);
                dataSet.push([
                    row.name,
                    row.description,
                    number_format(row.debit, 2),
                ]);
                sNo++;
            })

            // If result not found
            if (dataSet.length <= 0) {
                showToast('Sorry! Result not found.', 'danger');
                return false;
            }

            // Init Data Table
            const headings = ['Name', 'Description', 'Total'];
            HtmlHelper.initDataTable(tableId, dataSet, headings);
            HtmlHelper.setDataTableFooter(tableId, '<td colspan="2">Total</td><td>' + number_format(total, 2) + '</td>');

            let selAccount;
            if (isset(chartsOfAccounts[account.value])) {
                selAccount = chartsOfAccounts[account.value];
            }

            if (type == 'pdf' || type == 'wpdf') {
                ReportsController.generateSupplierPDF(headings, dataSet, total, dayOfReport.format('DD-MM-YYYY'), selAccount, type);
            } else if (type == 'xsl' || type == 'wxsl') {
                // Push total
                dataSet.push(['Total', '', number_format(total, 2)]);
                ReportsController.generateXSL(2, headings, dataSet, selAccount, type);
            } else {
                const info                             = document.getElementById('supplier-report-information');
                info.querySelector('.a').innerHTML     = selAccount.ac_id
                info.querySelector('.n').innerHTML     = selAccount.name
                info.querySelector('.print').innerHTML = moment().format('DD-MM-YYYY')
                info.querySelector('.from').innerHTML  = dayOfReport.format('DD-MM-YYYY')

                hideLoader();
                window.$('#modal-supplier').modal('show')
            }
        })
    }

    static generateSupplierPDF(headings, dataSet, total, dayOfReport, selAccount, type) {
        const doc = new jsPDF();
        headings  = headings.map(x => (x.title));

        let img = new Image();
        img.src = './assets/img/logo.png';
        doc.addImage(img, 'PNG', 15, 10);

        const inWidth = doc.internal.pageSize.width;

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 15, 'Print on:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 15, moment().format('DD-MM-YYYY'));

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 20, 'A/C ID:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 20, selAccount.ac_id);

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 25, 'Name:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 25, selAccount.name);

        dataSet.push([
            'Total',
            '',
            number_format(total, 2),
        ]);

        doc.autoTable({
            margin: {top: 35},
            head: [headings],
            body: dataSet,
            columnStyles: {
                0: {minCellWidth: 30},
                2: {minCellWidth: 30}
            },
            headStyles: {fillColor: '#00a65a', fontSize: 10},
            bodyStyles: {fontSize: 8}
        });

        if (type == 'wpdf') {
            let blob = doc.output('datauristring');
            ReportsController.send2server('pdf', blob).then(function (url) {
                hideLoader();
                url = "https://wa.me/?text=" + url;
                shell.openExternal(url);
            });
        } else {
            hideLoader();
            doc.save(moment().format('YYYY-MM-DD') + ' Supplier ' + selAccount.name + '.pdf');
        }
    }


    /**
     * Get profit and loss Reports Section Start
     */
    static profitAndLoss() {
        let start = document.getElementById('profit-report-start-date');
        let end   = document.getElementById('profit-report-end-date');

        let buttons = [
            {type: 'show', id: 'show_profit_report'},
            {type: 'pdf', id: 'download_profit_report_pdf'},
            {type: 'xsl', id: 'download_profit_report_xsl'},
            {type: 'wpdf', id: 'whats_app_profit_report_pdf'},
            {type: 'wxsl', id: 'whats_app_profit_report_xsl'}
        ];

        Array.prototype.forEach.call(buttons, (button) => {
            let btnEle = document.getElementById(button.id);
            btnEle.addEventListener('click', function () {
                ReportsController.getProfitAndLossRecord(start, end, button.type);
            });
        });
    }

    static getProfitAndLossRecord(start, end, type) {
        const tableId   = '#profit_reports_list';
        let startReport = start.value;
        let endReport   = end.value;

        Reports.getProfitAndLossReports().then(function (results) {
            let sNo = 1, dataSet = [], dates = [], total = 0;

            Array.prototype.forEach.call(results, (row) => {
                dates.push(row.created_at);
            })

            if (startReport == '') {
                startReport = isset(dates[0]) ? moment(dates[0]) : ''
            } else {
                startReport = moment(startReport, 'DD/MM/YYYY');
            }
            if (endReport == '') {
                let last  = dates.length - 1;
                endReport = isset(dates[last]) ? moment(dates[last]) : ''
            } else {
                endReport = moment(endReport, 'DD/MM/YYYY');
            }

            let $isHeader = true;
            Array.prototype.forEach.call(results, (row) => {

                let created = moment(row.created_at).format('YYYY-MM-DD');
                if (startReport.format('YYYY-MM-DD') <= created && endReport.format('YYYY-MM-DD') >= created) {
                    if ($isHeader) {
                        let hDis = (total >= 0) ? 'Dr' : 'Cr';
                        dataSet.push(['', '', 'B/F', '', '', number_format(total, 2) + ' ' + hDis]);
                        $isHeader = false;
                    }
                }

                total = parseFloat(total) - parseFloat(row.credit);
                total = parseFloat(total) + parseFloat(row.debit);

                if (startReport.format('YYYY-MM-DD') <= created && endReport.format('YYYY-MM-DD') >= created) {
                    let aDis = (total >= 0) ? 'Dr' : 'Cr';
                    dataSet.push([
                        sNo,
                        moment(row.created_at).format('DD-MM-YYYY'),
                        row.name + '(' + row.ac_id + ') ' + row.description,
                        number_format(row.debit, 2),
                        number_format(row.credit, 2),
                        number_format(total, 2) + ' ' + aDis
                    ]);
                    sNo++;
                }
            })

            // If result not found
            if (dataSet.length <= 0) {
                showToast('Sorry! Result not found.', 'danger');
                return false;
            }

            // Init Data Table
            const headings = ['No', 'Date', 'Description', 'Debit', 'Credit', 'Total'];
            HtmlHelper.initDataTable(tableId, dataSet, headings);

            startReport = startReport.format('DD-MM-YYYY');
            endReport   = endReport.format('DD-MM-YYYY');

            if (type == 'pdf' || type == 'wpdf') {
                ReportsController.generateProfitAndLossPDF(headings, dataSet, startReport, endReport, type);
            } else if (type == 'xsl' || type == 'wxsl') {
                ReportsController.generateXSL(3, headings, dataSet, {
                    ac_id: 'Profit and Loss',
                    name: 'Profit and Loss'
                }, type);
            } else {
                const info                             = document.getElementById('profit-report-information');
                info.querySelector('.print').innerHTML = moment().format('DD-MM-YYYY')
                info.querySelector('.from').innerHTML  = startReport
                info.querySelector('.to').innerHTML    = endReport

                hideLoader();
                window.$('#modal-profit-loss').modal('show')
            }
        })
    }

    static generateProfitAndLossPDF(headings, dataSet, start, end, type) {
        const doc = new jsPDF();
        headings  = headings.map(x => (x.title));

        let img = new Image();
        img.src = './assets/img/logo.png';
        doc.addImage(img, 'PNG', 15, 10);

        const inWidth = doc.internal.pageSize.width;

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 15, 'Print on:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 15, moment().format('DD-MM-YYYY'));

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 20, 'From:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 20, start);

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 25, 'To:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 25, end);

        doc.autoTable({
            margin: {top: 35},
            head: [headings],
            body: dataSet,
            columnStyles: {
                0: {halign: 'center', minCellWidth: 10},
                1: {halign: 'center', minCellWidth: 20},
                3: {minCellWidth: 25},
                4: {minCellWidth: 25},
                5: {minCellWidth: 30}
            },
            headStyles: {fillColor: '#00a65a', fontSize: 10},
            bodyStyles: {fontSize: 8}
        });

        if (type == 'wpdf') {
            let blob = doc.output('datauristring');
            ReportsController.send2server('pdf', blob).then(function (url) {
                hideLoader();
                url = "https://wa.me/?text=" + url;
                shell.openExternal(url);
            });
        } else {
            hideLoader();
            doc.save(moment().format('YYYY-MM-DD') + ' Profit and Loss.pdf');
        }
    }


    /**
     * Get Vehicle Reports Section Start
     */
    static vehicle() {
        let start = document.getElementById('vehicle-report-start-date');
        let end   = document.getElementById('vehicle-report-end-date');
        let type  = document.getElementById('vehicle-reports-type');

        let buttons = [
            {type: 'show', id: 'show_vehicle_report'},
            {type: 'pdf', id: 'download_vehicle_report_pdf'},
            {type: 'xsl', id: 'download_vehicle_report_xsl'},
            {type: 'wpdf', id: 'whats_app_vehicle_report_pdf'},
            {type: 'wxsl', id: 'whats_app_vehicle_report_xsl'}
        ];

        Array.prototype.forEach.call(buttons, (button) => {
            let btnEle = document.getElementById(button.id);
            btnEle.addEventListener('click', function () {
                ReportsController.getVehicleRecord(start, end, button.type, type);
            });
        });
    }

    static getVehicleRecord(start, end, type, vehicleType) {
        const tableId   = '#vehicle_reports_list';
        let startReport = start.value;
        let endReport   = end.value;

        Reports.getVehicleReports(vehicleType.value).then(function (results) {
            let sNo = 1, dataSet = [], dates = [], total = 0;

            Array.prototype.forEach.call(results, (row) => {
                dates.push(row.created_at);
            })

            if (startReport == '') {
                startReport = isset(dates[0]) ? moment(dates[0]) : ''
            } else {
                startReport = moment(startReport, 'DD/MM/YYYY');
            }
            if (endReport == '') {
                let last  = dates.length - 1;
                endReport = isset(dates[last]) ? moment(dates[last]) : ''
            } else {
                endReport = moment(endReport, 'DD/MM/YYYY');
            }

            Array.prototype.forEach.call(results, (row) => {

                let created = moment(row.created_at).format('YYYY-MM-DD');
                if (startReport.format('YYYY-MM-DD') <= created && endReport.format('YYYY-MM-DD') >= created) {
                    dataSet.push([
                        sNo,
                        moment(row.created_at).format('DD-MM-YYYY'),
                        row.product + ' - ' + row.reg_no + ' (' + row.terminal + ')',
                        row.quantity + ' KL',
                        number_format(row.price, 2),
                        number_format(row.total, 2),
                    ]);
                    sNo++;
                }
            })

            // If result not found
            if (dataSet.length <= 0) {
                showToast('Sorry! Result not found.', 'danger');
                return false;
            }

            // Init Data Table
            const headings = ['No', 'Date', 'Description', 'Quantity', 'Price', 'Total'];
            HtmlHelper.initDataTable(tableId, dataSet, headings);

            startReport = startReport.format('DD-MM-YYYY');
            endReport   = endReport.format('DD-MM-YYYY');

            if (type == 'pdf' || type == 'wpdf') {
                ReportsController.generateVehiclePDF(headings, dataSet, startReport, endReport, type);
            } else if (type == 'xsl' || type == 'wxsl') {
                const selAccount = {ac_id: vehicleType.options[vehicleType.selectedIndex].innerHTML, name: 'Vehicles'};
                ReportsController.generateXSL(3, headings, dataSet, selAccount, type);
            } else {
                const info                             = document.getElementById('vehicle-report-information');
                info.querySelector('.print').innerHTML = moment().format('DD-MM-YYYY')
                info.querySelector('.from').innerHTML  = startReport
                info.querySelector('.to').innerHTML    = endReport

                hideLoader();
                window.$('#modal-vehicle').modal('show')
            }
        })
    }

    static generateVehiclePDF(headings, dataSet, start, end, type) {
        const doc = new jsPDF();
        headings  = headings.map(x => (x.title));

        let img = new Image();
        img.src = './assets/img/logo.png';
        doc.addImage(img, 'PNG', 15, 10);

        const inWidth = doc.internal.pageSize.width;

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 15, 'Print on:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 15, moment().format('DD-MM-YYYY'));

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 20, 'From:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 20, start);

        doc.setFontSize(10);
        doc.setFontType('bold');
        doc.text((inWidth - 65), 25, 'To:');
        doc.setFontType('normal');
        doc.text((inWidth - 35), 25, end);

        doc.autoTable({
            margin: {top: 35},
            head: [headings],
            body: dataSet,
            columnStyles: {
                0: {halign: 'center', minCellWidth: 10},
                1: {halign: 'center', minCellWidth: 20},
                3: {minCellWidth: 25},
                4: {minCellWidth: 25},
                5: {minCellWidth: 30}
            },
            headStyles: {fillColor: '#00a65a', fontSize: 10},
            bodyStyles: {fontSize: 8}
        });

        if (type == 'wpdf') {
            let blob = doc.output('datauristring');
            ReportsController.send2server('pdf', blob).then(function (url) {
                hideLoader();
                url = "https://wa.me/?text=" + url;
                shell.openExternal(url);
            });
        } else {
            hideLoader();
            doc.save(moment().format('YYYY-MM-DD') + ' Vehicle Reports.pdf');
        }
    }


    /**
     * General function for all type of reports
     * @param chartsOfAccounts
     */
    static getSelect2Option(chartsOfAccounts) {
        let form          = document.getElementById('reports-form')
        let accountID     = form.querySelectorAll('select[name=account]')
        let supplierID    = form.querySelectorAll('select[name=supplier-accounts]')
        let vehicleTypeID = form.querySelectorAll('select[name=vehicle-type]')
        let vehicleType   = [{id: 1, html: 'Purchase', text: 'Purchase'}, {id: 2, html: 'Sales', text: 'Sales'}];

        Accounts.getAccounts().then(function (results) {
            let pills = [], suppliers = [];

            Array.prototype.forEach.call(results, (row) => {
                pills.push(HtmlHelper.getObjectOfPill(row));

                // Supplier
                if (parseInt(row.type) == 2) {
                    suppliers.push(HtmlHelper.getObjectOfPill(row));
                }

                chartsOfAccounts[row.id] = row;
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(accountID, pills)
            HtmlHelper.initSelect2Field(supplierID, suppliers)
            HtmlHelper.initSelect2Field(vehicleTypeID, vehicleType)

            // Hide loader
            hideLoader()
        })
    }

    static generateXSL(type, headings, dataSet, selAccount, ty) {
        let filename = moment().format('YYYY-MM-DD') + ' ';
        let row1     = ['Yadgar Carriage', '', '', '', '', ''];
        let row2     = ['Ac/Id: ', selAccount.ac_id, '', '', 'Name: ', selAccount.name];
        let wsCols   = [
            {wpx: 50}, // "pixels"
            {wpx: 120}, // "pixels"
            {wpx: 300}, // "pixels"
            {wpx: 120}, // "pixels"
            {wpx: 120}, // "pixels"
            {wpx: 180}, // "pixels"
        ];

        if (type == 1 || type == 3) {
            filename = filename + selAccount.name;
        } else if (type == 2) {
            filename = filename + ' Supplier ' + selAccount.name;
            row1     = [];
            row2     = [selAccount.ac_id, selAccount.name, ''];
            wsCols   = [
                {wpx: 200}, // "pixels"
                {wpx: 300}, // "pixels"
                {wpx: 180}, // "pixels"
            ];
        }

        const workbook = XLSX.utils.book_new();

        headings = headings.map(x => (x.title));

        dataSet.unshift(headings);
        dataSet.unshift([]);
        dataSet.unshift([]);
        dataSet.unshift(row2);
        dataSet.unshift([]);
        dataSet.unshift(row1);

        const ws      = XLSX.utils.aoa_to_sheet(dataSet);
        ws['!cols']   = wsCols;
        ws['!merges'] = [{s: {r: 0, c: 0}, e: {r: 0, c: 5}}];
        XLSX.utils.book_append_sheet(workbook, ws, selAccount.ac_id);
        const workbookOut = XLSX.write(workbook, {bookType: 'xlsx', type: 'binary'});

        function s2ab(s) {
            const buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
            let view  = new Uint8Array(buf);  //create uint8array as viewer
            for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
            return buf;
        }

        if (ty == 'wxsl') {
            const workbookOut4Server = XLSX.write(workbook, {bookType: 'xlsx', type: 'base64'});
            ReportsController.send2server('xsl', workbookOut4Server).then(function (url) {
                hideLoader();
                url = "https://wa.me/?text=" + url;
                shell.openExternal(url);
            });
        } else {
            hideLoader()
            FileSaver.saveAs(new Blob([s2ab(workbookOut)], {type: "application/octet-stream"}), filename + '.xlsx');
        }
    }

    static async send2server(type, data) {
        return new Promise(function (release, reject) {
            request({
                uri: serverHost + '/api/save/whats/app',
                method: 'POST',
                form: {type: type, machineId: machine.machineIdSync(), whats_app_file: data},
            }, function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    release(JSON.parse(body));
                } else {
                    console.log(error, response, body);
                    release(1);
                }
            });
        });
    }
}

module.exports = ReportsController