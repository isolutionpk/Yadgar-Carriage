const Ledger    = require('../models/Ledger');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const settings  = require('electron-settings');
const moment    = require('moment');

class LedgersController {

    constructor(elementId) {
        showLoader();
        const user = settings.get('loggedUser');
        switch (elementId) {
            case 'ledger-accounts1':
            case 'ledger-accounts2':
            case 'ledger-accounts3':
            case 'ledger-accounts4':
            case 'ledger-accounts5':
                return this.index(user)
            default:
                return console.log(123)
        }
    }

    /**
     * Get Section
     * @returns {Element}
     */
    static getS() {
        return document.getElementById('ledger-accounts-section')
    }

    index(user) {
        let start = document.getElementById('ledger-start-date')
        let end   = document.getElementById('ledger-end-date')

        if (start.value.trim() === '') {
            start.value = moment().format('DD/MM/YYYY');
        }
        if (end.value.trim() === '') {
            end.value = moment().format('DD/MM/YYYY');
        }

        this.getRecord(start, end, user);
        this.filter(start, end, user);
    }

    filter(start, end, user) {
        let form = document.getElementById('ledger-filter-form')

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

            this.getRecord(start, end, user);
        }
    }

    getRecord(start, end, user) {
        const tableId = '#ledger_list';
        Ledger.getLedgers(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [];

            const disabled = LedgersController.isDisabled(user);

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'ledger-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getSelect2InputFieldHtml('credit', 'ledger-edit-credit-' + row.id, row.credit, disabled),
                    HtmlHelper.getInputFieldHtml('total', 'ledger-edit-total-' + row.id, 'number', false, row.total, disabled),
                    HtmlHelper.getSelect2InputFieldHtml('debit', 'ledger-edit-debit-' + row.id, row.debit, disabled),
                    HtmlHelper.getInputFieldHtml('description', 'ledger-edit-description-' + row.id, false, false, row.description, disabled),
                    HtmlHelper.getStatusOfRow(row.id, disabled)
                ]);
                sNo++;
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, [
                'No',
                ['select', 'Credit'],
                ['text-numeric', 'Amount'],
                ['select', 'Debit'],
                ['text', 'Description'],
                'Status'
            ])
            if (!disabled) {
                HtmlHelper.setDataTableFooter(tableId, LedgersController.defaultRow(sNo))
            }
            LedgersController.getSelect2Option()
            LedgersController.create();
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('credit', 'ledger-add-credit'),
            HtmlHelper.getInputFieldHtml('total', 'ledger-add-total', 'number'),
            HtmlHelper.getSelect2InputFieldHtml('debit', 'ledger-add-debit'),
            HtmlHelper.getInputFieldHtml('description', 'ledger-add-description'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table   = document.getElementById('ledger_list')
        let created = document.getElementById('ledger-created-date')
        let inputs  = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;
                    if (validateInputFields(data, 'credit')) {
                        if (isset(data['id'])) {
                            Ledger.updateLedger(data).then(function (result) {
                                showToast('Credit/Debit entry updated successfully')
                                statusCol.childNodes[1].classList.remove('hide');
                                statusCol.childNodes[2].classList.add('hide');
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                Ledger.createLedger(data, created).then(function (result) {
                                    const section = document.getElementById('ledger-accounts3')
                                    if (section) section.click()

                                    showToast('Credit/Debit entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table    = document.getElementById('ledger_list')
        let creditID = LedgersController.getS().querySelectorAll('select[name=credit]')
        let debitID  = LedgersController.getS().querySelectorAll('select[name=debit]')

        Accounts.getAccounts().then(function (results) {
            let credit = [], debit = [];

            Array.prototype.forEach.call(results, (row) => {
                credit.push(HtmlHelper.getObjectOfPill(row));
                debit.push(HtmlHelper.getObjectOfPill(row));
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(creditID, credit)
            HtmlHelper.initSelect2Field(debitID, debit)
            // Update row status
            HtmlHelper.updateRowStatus(table)
            // Delete row
            HtmlHelper.deleteTableRow(Accounts, table, 'ledger')
            // Hide loader
            hideLoader()
        })
    }

    static isDisabled(user) {
        let disabled = true;
        if (isAdmin(user.role)) {
            disabled = false
        } else if (isset(user.permissions.daybook) && user.permissions.daybook.write) {
            disabled = false
        }
        return disabled;
    }
}

module.exports = LedgersController