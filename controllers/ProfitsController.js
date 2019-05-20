const ProfitsLoss = require('../models/ProfitsLoss');
const Accounts    = require('../models/Accounts');
const serialize   = require('node-serialize');
const settings    = require('electron-settings');
const moment      = require('moment');

class ProfitsController {

    constructor(elementId) {
        showLoader();
        const user = settings.get('loggedUser');
        switch (elementId) {
            case 'profit-loss1':
            case 'profit-loss2':
            case 'profit-loss3':
            case 'profit-loss4':
            case 'profit-loss5':
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
        return document.getElementById('profit-loss-section')
    }

    index(user) {
        let start = document.getElementById('profit-start-date')
        let end   = document.getElementById('profit-end-date')

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
        let form = document.getElementById('profit-filter-form')

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
        const tableId = '#profit_list';
        ProfitsLoss.getProfitsLosses(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [];

            const disabled = ProfitsController.isDisabled(user);

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'profit-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getSelect2InputFieldHtml('account', 'profit-edit-account-' + row.id, row.account, disabled),
                    HtmlHelper.getInputFieldHtml('debit', 'profit-edit-debit-' + row.id, 'number', false, row.debit, disabled),
                    HtmlHelper.getInputFieldHtml('credit', 'profit-edit-credit-' + row.id, 'number', false, row.credit, disabled),
                    HtmlHelper.getInputFieldHtml('description', 'profit-edit-description-' + row.id, false, false, row.description, disabled),
                    HtmlHelper.getStatusOfRow(row.id, disabled)
                ]);
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
            if (!disabled) {
                HtmlHelper.setDataTableFooter(tableId, ProfitsController.defaultRow(sNo))
            }
            ProfitsController.getSelect2Option()
            ProfitsController.create()
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('account', 'profit-add-account'),
            HtmlHelper.getInputFieldHtml('debit', 'profit-add-debit', 'number'),
            HtmlHelper.getInputFieldHtml('credit', 'profit-add-credit', 'number'),
            HtmlHelper.getInputFieldHtml('description', 'profit-add-description'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table   = document.getElementById('profit_list')
        let created = document.getElementById('profit-created-date')
        let inputs  = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;
                    if (validateInputFields(data, 'account')) {
                        if (isset(data['id'])) {
                            ProfitsLoss.updateProfitsLoss(data).then(function (result) {
                                showToast('Profits and Loss entry updated successfully')
                                statusCol.childNodes[1].classList.remove('hide');
                                statusCol.childNodes[2].classList.add('hide');
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                ProfitsLoss.createProfitsLoss(data, created).then(function (result) {
                                    const section = document.getElementById('profit-loss5')
                                    if (section) section.click()

                                    showToast('Profits and Loss entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table     = document.getElementById('profit_list')
        let accountID = ProfitsController.getS().querySelectorAll('select[name=account]')

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
            HtmlHelper.deleteTableRow(Accounts, table, 'profits')
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

module.exports = ProfitsController