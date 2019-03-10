const Sales     = require('../models/Sales');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const moment    = require('moment');

class SalesController {

    constructor(elementId) {
        showLoader();
        switch (elementId) {
            case 'sales-accounts1':
            case 'sales-accounts2':
            case 'sales-accounts3':
            case 'sales-accounts4':
            case 'sales-accounts5':
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
        return document.getElementById('sales-accounts-section')
    }

    index() {
        let start = document.getElementById('sales-start-date')
        let end   = document.getElementById('sales-end-date')

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
        let form = document.getElementById('sales-filter-form')

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
        const tableId = '#sales_list';
        Sales.getSales(start.value, end.value).then(function (results) {
            let sNo = 1, dataSet = [];

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'sales-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getSelect2InputFieldHtml('product', 'sales-edit-product-' + row.id, row.product),
                    HtmlHelper.getInputFieldHtml('quantity', 'sales-edit-quantity-' + row.id, 'number', false, row.quantity),
                    HtmlHelper.getInputFieldHtml('price', 'sales-edit-price-' + row.id, 'number', false, row.price),
                    HtmlHelper.getInputFieldHtml('total', 'sales-edit-total-' + row.id, 'number', false, row.total, true),
                    HtmlHelper.getSelect2InputFieldHtml('customer', 'sales-edit-customer-' + row.id, row.customer),
                    HtmlHelper.getInputFieldHtml('description', 'sales-edit-description-' + row.id, false, false, row.description),
                    HtmlHelper.getInputFieldHtml('reg_no', 'sales-edit-reg_no-' + row.id, false, false, row.reg_no),
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
                ['select', 'Customer'],
                ['text', 'Description'],
                ['text', 'TL Reg No'],
                'Status'
            ])
            HtmlHelper.setDataTableFooter(tableId, SalesController.defaultRow(sNo))
            SalesController.updateTotalAmount()
            SalesController.getSelect2Option()
            SalesController.create();
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getSelect2InputFieldHtml('product', 'sales-add-product'),
            HtmlHelper.getInputFieldHtml('quantity', 'sales-add-quantity', 'number'),
            HtmlHelper.getInputFieldHtml('price', 'sales-add-price', 'number'),
            HtmlHelper.getInputFieldHtml('total', 'sales-add-total', 'number', false, false, true),
            HtmlHelper.getSelect2InputFieldHtml('customer', 'sales-add-customer'),
            HtmlHelper.getInputFieldHtml('description', 'sales-add-description', false, false, 'Sale'),
            HtmlHelper.getInputFieldHtml('reg_no', 'sales-add-reg_no'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create() {
        let table  = document.getElementById('sales_list')
        let created = document.getElementById('sales-created-date')
        let inputs = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;
                    if (validateInputFields(data, 'product')) {
                        if (isset(data['id'])) {
                            Sales.updateSales(data).then(function (result) {
                                showToast('Sales entry updated successfully')
                                statusCol.childNodes[1].classList.remove('hide');
                                statusCol.childNodes[2].classList.add('hide');
                            })
                        } else {
                            if (HtmlHelper.isValidCreatedDate(moment, created)) {
                                Sales.createSales(data, created).then(function (result) {
                                    const section = document.getElementById('sales-accounts2')
                                    if (section) section.click()

                                    showToast('Sales entry added successfully')
                                })
                            }
                        }
                    }
                }
            });
        });
    }

    static getSelect2Option() {
        let table      = document.getElementById('sales_list')
        let productID  = SalesController.getS().querySelectorAll('select[name=product]')
        let customerID = SalesController.getS().querySelectorAll('select[name=customer]')

        Accounts.getAccounts([5, 1]).then(function (results) {
            let products = [], customer = [];

            Array.prototype.forEach.call(results, (row) => {
                // Products
                if (parseInt(row.type) == 5) {
                    products.push(HtmlHelper.getObjectOfPill(row));
                }
                // Customer
                if (parseInt(row.type) == 1) {
                    customer.push(HtmlHelper.getObjectOfPill(row));
                }
            });

            // Init Select 2
            HtmlHelper.initSelect2Field(productID, products)
            HtmlHelper.initSelect2Field(customerID, customer)
            // Update row status
            HtmlHelper.updateRowStatus(table)
            // Delete row
            HtmlHelper.deleteTableRow(Accounts, table, 'sales')
            // Hide loader
            hideLoader()
        })
    }

    static updateTotalAmount() {
        let quantity = SalesController.getS().querySelectorAll('input[name=quantity]')
        let rate     = SalesController.getS().querySelectorAll('input[name=price]')

        // Add event on change of quantity
        Array.prototype.forEach.call(quantity, (elem) => {
            elem.addEventListener('change', function (event) {
                let price   = event.target.parentNode.nextSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.nextSibling.childNodes[0];
                total.value = Math.round(event.target.value * price.value)
            });
            elem.addEventListener('input', function (event) {
                let price   = event.target.parentNode.nextSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.nextSibling.childNodes[0];
                total.value = Math.round(event.target.value * price.value)
            });
        });

        // Add event on change of price
        Array.prototype.forEach.call(rate, (elem) => {
            elem.addEventListener('change', function (event) {
                let qty     = event.target.parentNode.previousSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.childNodes[0];
                total.value = Math.round(event.target.value * qty.value)
            });
            elem.addEventListener('input', function (event) {
                let qty     = event.target.parentNode.previousSibling.childNodes[0];
                let total   = event.target.parentNode.nextSibling.childNodes[0];
                total.value = Math.round(event.target.value * qty.value)
            });
        });
    }
}

module.exports = SalesController