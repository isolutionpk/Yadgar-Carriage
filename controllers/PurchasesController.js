const Purchases = require('../models/Purchases');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const moment    = require('moment');

class PurchasesController {

    constructor(elementId) {
        showLoader();
        switch (elementId) {
            case 'purchases-day-book':
            case 'purchases-accounts1':
            case 'purchases-accounts2':
            case 'purchases-accounts3':
            case 'purchases-accounts4':
            case 'purchases-accounts5':
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
        return document.getElementById('purchases-accounts-section')
    }

    index() {
        let start = document.getElementById('purchases-start-date')
        let end   = document.getElementById('purchases-end-date')

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
        let form = document.getElementById('purchases-filter-form')

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
        const tableId = '#purchases_list';
        Purchases.getPurchases(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [];

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'purchases-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getSelect2InputFieldHtml('product', 'purchases-edit-product-' + row.id, row.product),
                    HtmlHelper.getInputFieldHtml('quantity', 'purchases-edit-quantity-' + row.id, 'number', false, row.quantity),
                    HtmlHelper.getInputFieldHtml('price', 'purchases-edit-price-' + row.id, 'number', false, row.price),
                    HtmlHelper.getInputFieldHtml('total', 'purchases-edit-total-' + row.id, 'number', false, row.total, true),
                    HtmlHelper.getSelect2InputFieldHtml('supplier', 'purchases-edit-supplier-' + row.id, row.supplier),
                    HtmlHelper.getSelect2InputFieldHtml('terminal', 'purchases-edit-terminal-' + row.id, row.terminal),
                    HtmlHelper.getInputFieldHtml('reg_no', 'purchases-edit-reg_no-' + row.id, false, false, row.reg_no),
                    HtmlHelper.getStatusOfRow(row.id)
                ]);
                sNo++;
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, [
                'No',
                ['select', 'Product'],
                ['text-numeric', 'Qty'],
                ['text-numeric', 'Rate'],
                ['text-numeric', 'Amount'],
                ['select', 'Supplier'],
                ['select', 'Terminal'],
                ['text', 'TL Reg No'],
                'Status'
            ])
            HtmlHelper.setDataTableFooter(tableId, PurchasesController.defaultRow(sNo))
            PurchasesController.updateTotalAmount()
            PurchasesController.getSelect2Option()
            PurchasesController.create();
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('product', 'purchases-add-product'),
            HtmlHelper.getInputFieldHtml('quantity', 'purchases-add-quantity', 'number'),
            HtmlHelper.getInputFieldHtml('price', 'purchases-add-price', 'number'),
            HtmlHelper.getInputFieldHtml('total', 'purchases-add-total', 'number', false, false, true),
            HtmlHelper.getSelect2InputFieldHtml('supplier', 'purchases-add-supplier'),
            HtmlHelper.getSelect2InputFieldHtml('terminal', 'purchases-add-terminal'),
            HtmlHelper.getInputFieldHtml('reg_no', 'purchases-add-reg_no'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table   = document.getElementById('purchases_list')
        let created = document.getElementById('purchases-created-date')
        let inputs  = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;
                    if (validateInputFields(data, 'product')) {
                        if (isset(data['id'])) {
                            Purchases.updatePurchases(data).then(function (result) {
                                showToast('Purchases entry updated successfully')
                                statusCol.childNodes[1].classList.remove('hide');
                                statusCol.childNodes[2].classList.add('hide');
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                Purchases.createPurchases(data, created).then(function (result) {
                                    const section = document.getElementById('purchases-accounts1')
                                    if (section) section.click()

                                    showToast('Purchases entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table      = document.getElementById('purchases_list')
        let productID  = PurchasesController.getS().querySelectorAll('select[name=product]')
        let supplierID = PurchasesController.getS().querySelectorAll('select[name=supplier]')
        let terminalID = PurchasesController.getS().querySelectorAll('select[name=terminal]')

        Accounts.getAccounts([2, 5, 7]).then(function (results) {
            let products = [], supplier = [], terminal = [];

            Array.prototype.forEach.call(results, (row) => {
                // Products
                if (parseInt(row.type) == 5) {
                    products.push(HtmlHelper.getObjectOfPill(row));
                }
                // Supplier
                if (parseInt(row.type) == 2) {
                    supplier.push(HtmlHelper.getObjectOfPill(row));
                }
                // Terminal
                if (parseInt(row.type) == 7) {
                    terminal.push(HtmlHelper.getObjectOfPill(row));
                }
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(productID, products)
            HtmlHelper.initSelect2Field(supplierID, supplier)
            HtmlHelper.initSelect2Field(terminalID, terminal)
            // Update row status
            HtmlHelper.updateRowStatus(table)
            // Delete row
            HtmlHelper.deleteTableRow(Accounts, table, 'purchases')
            // Hide loader
            hideLoader()
        })
    }

    static updateTotalAmount() {
        let quantity = PurchasesController.getS().querySelectorAll('input[name=quantity]')
        let rate     = PurchasesController.getS().querySelectorAll('input[name=price]')

        // Add event on change of quantity
        Array.prototype.forEach.call(quantity, (elem) => {
            elem.addEventListener('change', function (event) {
                let price   = event.target.parentNode.nextSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.nextSibling.childNodes[0];
                total.value = event.target.value * price.value
            });
            elem.addEventListener('input', function (event) {
                let price   = event.target.parentNode.nextSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.nextSibling.childNodes[0];
                total.value = event.target.value * price.value
            });
        });

        // Add event on change of price
        Array.prototype.forEach.call(rate, (elem) => {
            elem.addEventListener('change', function (event) {
                let qty     = event.target.parentNode.previousSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.childNodes[0];
                total.value = event.target.value * qty.value
            });
            elem.addEventListener('input', function (event) {
                let qty     = event.target.parentNode.previousSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.childNodes[0];
                total.value = event.target.value * qty.value
            });
        });
    }
}

module.exports = PurchasesController