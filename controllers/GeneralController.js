const General   = require('../models/General');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const moment    = require('moment');

class GeneralController {

    constructor(elementId) {
        showLoader();
        switch (elementId) {
            case 'general-accounts1':
            case 'general-accounts2':
            case 'general-accounts3':
            case 'general-accounts4':
            case 'general-accounts5':
                return this.index()
            default:
                return console.log(123)
        }
    }

    /**
     * Get Section
     * @returns {Element}
     */
    static getS() {
        return document.getElementById('general-accounts-section')
    }

    index() {
        let start = document.getElementById('general-start-date')
        let end   = document.getElementById('general-end-date')

        if (start.value.trim() === '') {
            start.value = moment().format('DD/MM/YYYY');
        }
        if (end.value.trim() === '') {
            end.value = moment().format('DD/MM/YYYY');
        }

        this.getRecord(start, end);
        this.filter(start, end);
    }

    filter(start, end) {
        let form = document.getElementById('general-filter-form')

        form.onsubmit = (evt) => {
            evt.preventDefault();

            showLoader();

            if (start.value.trim() === '') {
                showToast('Please Enter start date', 'danger')
                return false;
            }
            if (end.value.trim() === '') {
                showToast('Please Enter end date', 'danger')
                return false;
            }

            this.getRecord(start, end);
        }
    }

    getRecord(start, end) {
        const tableId = '#general_list';
        General.getGenerals(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [], debit = 0, credit = 0;

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'general-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getSelect2InputFieldHtml('account', 'general-edit-account-' + row.id, row.account),
                    HtmlHelper.getInputFieldHtml('debit', 'general-edit-debit-' + row.id, 'number', false, row.debit),
                    HtmlHelper.getInputFieldHtml('credit', 'general-edit-credit-' + row.id, 'number', false, row.credit),
                    HtmlHelper.getInputFieldHtml('description', 'general-edit-description-' + row.id, false, false, row.description),
                    HtmlHelper.getStatusOfRow(row.id)
                ]);
                debit  = debit + parseFloat(row.debit);
                credit = credit + parseFloat(row.credit);
                sNo++;
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, [
                'No',
                ['select', 'Account'],
                ['text-numeric', 'Debit'],
                ['text-numeric', 'Credit'],
                ['text', 'Description'],
                'Status'
            ])
            HtmlHelper.setDataTableFooter(tableId, GeneralController.defaultRow(sNo))
            GeneralController.updateBalance(debit, credit)
            GeneralController.getSelect2Option()
            GeneralController.create()
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('account', 'general-add-account'),
            HtmlHelper.getInputFieldHtml('debit', 'general-add-debit', 'number'),
            HtmlHelper.getInputFieldHtml('credit', 'general-add-credit', 'number'),
            HtmlHelper.getInputFieldHtml('description', 'general-add-description'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table   = document.getElementById('general_list')
        let created = document.getElementById('general-created-date')
        let inputs  = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data = getFormValues(event.target.parentNode.parentNode);
                    if (validateInputFields(data, 'account')) {
                        if (isset(data['id'])) {
                            General.updateGeneral(data).then(function (result) {
                                const section = document.getElementById('general-accounts4')
                                if (section) section.click()

                                showToast('General entry updated successfully')
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                General.createGeneral(data, created).then(function (result) {
                                    const section = document.getElementById('general-accounts4')
                                    if (section) section.click()

                                    showToast('General entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table     = document.getElementById('general_list')
        let accountID = GeneralController.getS().querySelectorAll('select[name=account]')

        Accounts.getAccounts().then(function (results) {
            let pills = [];

            Array.prototype.forEach.call(results, (row) => {
                pills.push(HtmlHelper.getObjectOfPill(row));
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(accountID, pills)
            // Update row status
            HtmlHelper.updateRowStatus(table)
            // Delete row
            HtmlHelper.deleteTableRow(Accounts, table, 'general')
            // Hide loader
            hideLoader()
        })
    }

    static updateBalance(dr, cr) {
        let debit  = document.getElementById('general-debit-total')
        let credit = document.getElementById('general-credit-total')
        let total  = document.getElementById('general-amount-total')

        debit.value  = dr;
        credit.value = cr;
        total.value  = dr - cr;
    }
}

module.exports = GeneralController