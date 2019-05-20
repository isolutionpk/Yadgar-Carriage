const Cartage   = require('../models/Cartage');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const settings  = require('electron-settings');
const moment    = require('moment');

class CartageController {

    constructor(elementId) {
        showLoader();

        const user = settings.get('loggedUser');
        this.index(user)
    }

    /**
     * Get Section
     * @returns {Element}
     */
    static getS() {
        return document.getElementById('cartage-billing-section')
    }

    index(user) {
        let start = document.getElementById('cartage-start-date')
        let end   = document.getElementById('cartage-end-date')

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
        let form = document.getElementById('cartage-filter-form')

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
        const tableId = '#cartage_list';
        Cartage.getCartage(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [], debit = 0, credit = 0;

            const disabled = CartageController.isDisabled(user);

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'cartage-edit-id-' + row.id, 'hidden', false, row.id, disabled),
                    HtmlHelper.getSelect2InputFieldHtml('account', 'cartage-edit-account-' + row.id, row.account, disabled),
                    HtmlHelper.getSelect2InputFieldHtml('ledger', 'cartage-edit-ledger-' + row.id, row.ledger, disabled),
                    HtmlHelper.getInputFieldHtml('debit', 'cartage-edit-debit-' + row.id, 'number', false, row.debit, disabled),
                    HtmlHelper.getInputFieldHtml('credit', 'cartage-edit-credit-' + row.id, 'number', false, row.credit, disabled),
                    HtmlHelper.getInputFieldHtml('description', 'cartage-edit-description-' + row.id, false, false, row.description, disabled),
                    HtmlHelper.getStatusOfRow(row.id, disabled)
                ]);
                debit  = debit + parseFloat(row.debit);
                credit = credit + parseFloat(row.credit);
                sNo++;
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, [
                'No',
                ['select', 'Account'],
                ['select', 'Sub Ledger'],
                ['text-numeric', 'Debit'],
                ['text-numeric', 'Credit'],
                ['text', 'Description'],
                'Status'
            ])
            if (!disabled) {
                HtmlHelper.setDataTableFooter(tableId, CartageController.defaultRow(sNo))
            }
            CartageController.updateBalance(debit, credit)
            CartageController.getSelect2Option()
            CartageController.create()
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('account', 'cartage-add-account'),
            HtmlHelper.getSelect2InputFieldHtml('ledger', 'cartage-add-ledger'),
            HtmlHelper.getInputFieldHtml('debit', 'cartage-add-debit', 'number'),
            HtmlHelper.getInputFieldHtml('credit', 'cartage-add-credit', 'number'),
            HtmlHelper.getInputFieldHtml('description', 'cartage-add-description'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table   = document.getElementById('cartage_list')
        let created = document.getElementById('cartage-created-date')
        let inputs  = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;
                    if (validateInputFields(data, 'account')) {
                        if (isset(data['id'])) {
                            Cartage.updateCartage(data).then(function (result) {
                                const section = document.getElementById('cartage-billing')
                                if (section) section.click()

                                showToast('Cartage entry updated successfully')
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                Cartage.createCartage(data, created).then(function (result) {
                                    const section = document.getElementById('cartage-billing')
                                    if (section) section.click()

                                    showToast('Cartage entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table     = document.getElementById('cartage_list')
        let accountID = CartageController.getS().querySelectorAll('select[name=account]')
        let ledgerID  = CartageController.getS().querySelectorAll('select[name=ledger]')

        Accounts.getAccounts([8, 9, 10]).then(function (results) {
            let pills = [], ledger = [];

            Array.prototype.forEach.call(results, (row) => {
                // Truck accounts
                if (parseInt(row.type) == 8) {
                    pills.push(HtmlHelper.getObjectOfPill(row));
                }
                // Sub Ledger and Parts
                if (parseInt(row.type) == 9 || parseInt(row.type) == 10) {
                    ledger.push(HtmlHelper.getObjectOfPill(row));
                }
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(accountID, pills)
            HtmlHelper.initSelect2Field(ledgerID, ledger)
            // Update row status
            HtmlHelper.updateRowStatus(table)
            // Delete row
            HtmlHelper.deleteTableRow(Accounts, table, 'cartage')
            // Hide loader
            hideLoader()
        })
    }

    static updateBalance(dr, cr) {
        let debit  = document.getElementById('cartage-debit-total')
        let credit = document.getElementById('cartage-credit-total')
        let total  = document.getElementById('cartage-amount-total')

        debit.value  = dr;
        credit.value = cr;
        total.value  = dr - cr;
    }

    static isDisabled(user) {
        let disabled = true;
        if (isAdmin(user.role)) {
            disabled = false
        } else if (isset(user.permissions.vehicleBilling) && user.permissions.vehicleBilling.write) {
            disabled = false
        }
        return disabled;
    }
}

module.exports = CartageController