const Cartage   = require('../models/CartageDocument');
const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const moment    = require('moment');

class CartageDocumentsController {

    constructor(elementId) {
        showLoader();
        switch (elementId) {
            case 'cartage-documents':
                return this.index()
            default:
                return console.log(123)
        }
    }

    index() {
        const tableId = '#cartage_documents_list';
        const table   = document.getElementById('cartage_documents_list')
        Cartage.getDocuments().then(function (results) {
            let sNo = 1, dataSet = [];

            Array.prototype.forEach.call(results, (row) => {
                dataSet.push([
                    HtmlHelper.getSpanCell(sNo) +
                    HtmlHelper.getInputFieldHtml('id', 'documents-edit-id-' + row.id, 'hidden', false, row.id),
                    HtmlHelper.getInputFieldHtml('reg_no', 'documents-edit-reg_no-' + row.id, false, false, row.reg_no),
                    HtmlHelper.getInputFieldHtml('passing', 'documents-edit-passing-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.passing)),
                    HtmlHelper.getInputFieldHtml('dip_chart', 'documents-edit-dip_chart-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.dip_chart)),
                    HtmlHelper.getInputFieldHtml('route', 'documents-edit-route-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.route)),
                    HtmlHelper.getInputFieldHtml('token', 'documents-edit-token-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.token)),
                    HtmlHelper.getInputFieldHtml('insurance', 'documents-edit-insurance-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.insurance)),
                    HtmlHelper.getInputFieldHtml('explosive', 'documents-edit-explosive-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.explosive)),
                    HtmlHelper.getInputFieldHtml('tracker', 'documents-edit-tracker-' + row.id, 'date', false, HtmlHelper.getDocDate(moment, row.tracker)),
                    HtmlHelper.getStatusOfRow(row.id)
                ]);
                sNo++;
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, [
                'No',
                ['text', 'TL Reg No'],
                ['text', 'Passing Expiry'],
                ['text', 'Dip Chart Expiry'],
                ['text', 'Route Expiry'],
                ['text', 'Token Expiry'],
                ['text', 'Insurance'],
                ['text', 'Explosive Licence'],
                ['text', 'Tracker Certificate'],
                'Status'
            ])
            HtmlHelper.setDataTableFooter(tableId, CartageDocumentsController.defaultRow(sNo))
            CartageDocumentsController.create(table)
            HtmlHelper.updateRowStatus(table)
            HtmlHelper.deleteTableRow(Accounts, table, 'documents')
            hideLoader()
        })
    }

    static defaultRow(sNo) {
        let fields = [
            HtmlHelper.getSpanCell(sNo),
            HtmlHelper.getInputFieldHtml('reg_no', 'documents-add-reg_no'),
            HtmlHelper.getInputFieldHtml('passing', 'documents-add-passing', 'date'),
            HtmlHelper.getInputFieldHtml('dip_chart', 'documents-add-dip_chart', 'date'),
            HtmlHelper.getInputFieldHtml('route', 'documents-add-route', 'date'),
            HtmlHelper.getInputFieldHtml('token', 'documents-add-token', 'date'),
            HtmlHelper.getInputFieldHtml('insurance', 'documents-add-insurance', 'date'),
            HtmlHelper.getInputFieldHtml('explosive', 'documents-add-explosive', 'date'),
            HtmlHelper.getInputFieldHtml('tracker', 'documents-add-tracker', 'date'),
            HtmlHelper.getStatusOfRow()
        ];

        return HtmlHelper.setCell2Array(fields);
    }

    static create(table) {
        let inputs = table.querySelectorAll('input')

        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('keypress', function (event) {
                let key = event.which || event.keyCode;
                if (key === 13) {
                    let data      = getFormValues(event.target.parentNode.parentNode);
                    let statusCol = event.target.parentNode.parentNode.lastChild;

                    if (Cartage.isValidDates(data)) {
                        if (isset(data['id'])) {
                            Cartage.updateDocuments(data).then(function (result) {
                                showToast('Documents entry updated successfully')
                                statusCol.childNodes[1].classList.remove('hide');
                                statusCol.childNodes[2].classList.add('hide');
                            })
                        } else {
                            Cartage.createDocuments(data).then(function (result) {
                                const section = document.getElementById('cartage-documents')
                                if (section) section.click()

                                showToast('Documents entry added successfully')
                            })
                        }
                    }
                }
            });
        });
    }
}

module.exports = CartageDocumentsController