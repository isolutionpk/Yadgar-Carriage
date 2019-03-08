HtmlHelperClass = function () {

    /**
     * Get span cell
     * @param sNo
     * @returns {*}
     */
    this.getSpanCell = function (sNo) {
        return '<span class="padApply">' + sNo + '</span>';
    }

    /**
     * Get span cell
     * @param id
     * @returns {*}
     */
    this.getStatusOfRow = function (id) {
        id = id || '';

        let status = '<i class="fa fa-plus-square"></i>';
        if (id != '') {
            status = '<i class="fa fa-check-square-o"></i>' +
                     '<i class="fa fa-exclamation-circle hide"></i>' +
                     '<a href="#" class="delete-row" data-delete="' + id + '"><i class="fa fa-trash"></i></a>';
        }

        return '<i class="fa fa-pencil-square-o hide"></i>' + status;
    }

    /**
     * Get Input Field Html
     * @param name
     * @param id
     * @param type
     * @param className
     * @param value
     * @param isDisable
     * @returns {*}
     */
    this.getInputFieldHtml = function (name, id, type, className, value, isDisable) {
        className = className || 'form-control';
        type      = type || 'text';
        value     = value || '';
        isDisable = (isDisable) ? ' disabled ' : '';
        const min = (type == 'number') ? " min='0' " : '';

        let placeholder = '';
        if (type == 'date') {
            type        = 'text'
            placeholder = " placeholder='DD-MM-YYYY' ";

        }

        return '<input type="' + type + '" value="' + value + '" ' + min + isDisable + placeholder +
               'class="' + className + '" name="' + name + '" id="' + id + '" required="required">';
    }

    /**
     * Get Select2 Input Field Html
     * @param name
     * @param id
     * @param value
     * @returns {*}
     */
    this.getSelect2InputFieldHtml = function (name, id, value) {
        value = value || '';
        return '<select class="form-control select2" name="' + name + '" id="' + id + '" data-value="' + value + '" ' +
               'required="required"></select>';
    }

    /**
     * Set array to cell
     * @param fields
     * @returns {*}
     */
    this.setCell2Array = function (fields) {
        Array.prototype.forEach.call(fields, (field, $i) => {
            fields[$i] = '<td>' + field + '</td>'
        });

        return fields;
    }

    /**
     * Set array to cell
     * @param type
     * @param id
     * @returns {*}
     */
    this.getActionsBtnHtml = function (type, id) {
        return '<div class="btn-group">' +
               '<button class="btn btn-primary" id="' + type + '-edit-' + id + '" data-section="' + type + '-edit">Edit</button>' +
               '<button class="btn btn-danger delete-' + type + '" data-delete="' + id + '">Delete</button>' +
               '</div>';
    }

    /**
     * Init Data Table
     * @param tableId
     * @param dataSet
     * @param columns
     * @returns {*}
     */
    this.initDataTable = function (tableId, dataSet, columns) {
        // Getting Columns settings ready
        Array.prototype.forEach.call(columns, (title, $i) => {
            if (Array.isArray(title)) {
                let isString = (title[0] == 'text') ? {type: "string"} : {};
                columns[$i]  = Object.assign({title: title[1], orderDataType: 'dom-' + title[0]}, isString);
            } else {
                columns[$i] = {title: title}
            }
        });

        //"orderable": "false"

        const settings = (tableId == '#user_list' || tableId == '#account_list' || tableId.match(/reports_list/g));

        if (window.$.fn.dataTable.isDataTable(tableId)) {
            window.$(tableId).DataTable().destroy();
        }

        window.$(tableId).DataTable({
            language: {
                "zeroRecords": " "
            },
            data: dataSet,
            columns: columns,
            paging: settings,
            searching: settings,
            info: settings
        });
    }

    /**
     * Set Data Table Footer
     * @param tableId
     * @param columns
     * @returns {*}
     */
    this.setDataTableFooter = function (tableId, columns) {
        if (window.$(tableId).children('tfoot').length !== 0) {
            window.$(tableId).children('tfoot').remove();
        }
        window.$(tableId).append('<tfoot><tr>' + columns + '</tr></tfoot>')
    }

    /**
     * Get Object of Pill
     * @param row
     * @returns {{id, text: string, html: string}}
     */
    this.getObjectOfPill = function (row) {
        return {
            "id": row.id,
            "text": row.ac_id,
            "html": '<div><span>' + row.ac_id + '</span><span>' + getChartOfAccountsLabels(row.type) + '</span></div><span>' + row.name + '</span>'
        };
    }

    /**
     * Get Doc Date
     * @param moment
     * @param date
     * @returns {boolean}
     */
    this.getDocDate = function (moment, date) {
        if (date != '' && moment(date, 'YYYY-MM-DD', true).isValid()) {
            return moment(date).format('DD-MM-YYYY')
        }
        return false;
    }


    this.isValidCreatedDate = function (moment, created) {
        if (created.value.trim() !== '') {
            if (!moment(created.value, 'DD/MM/YYYY', true).isValid()) {
                showToast('Created date not valid (DD/MM/YYYY) date', 'danger');
                return false;
            }
        }
        return true;
    }

    /**
     * Init Select2
     * @param elements
     * @param pills
     * @returns {*}
     */
    this.initSelect2Field = function (elements, pills) {

        if (pills.length <= 0) {
            return false;
        }

        Array.prototype.forEach.call(elements, (element) => {
            // Get Element Id
            let id = element.getAttribute('id');

            // Set Empty
            window.$('#' + id).select2().empty();

            function template(data) {
                return data.html;
            }

            // Init
            window.$('#' + id).select2({
                placeholder: "Select a option",
                allowClear: true,
                data: pills,
                templateResult: template,
                escapeMarkup: function (m) {
                    return m;
                }
            });

            window.$('#' + id).val(element.dataset.value).trigger('change');
        });

    }

    /**
     * Update Row status
     * @param table
     */
    this.updateRowStatus = function (table) {
        let inputs  = table.querySelectorAll('input')
        let selects = table.querySelectorAll('.select2-selection')

        // Added listener on inputs
        Array.prototype.forEach.call(inputs, (input) => {
            input.addEventListener('focus', function (event) {
                let status = event.target.parentNode.parentNode.lastChild;
                status.childNodes[0].classList.remove('hide');
            });
            input.addEventListener('blur', function (event) {
                let status = event.target.parentNode.parentNode.lastChild;
                status.childNodes[0].classList.add('hide');
            });
            input.addEventListener('change', function (event) {
                let tr = event.target.parentNode.parentNode;
                if (tr.parentNode.tagName != 'TFOOT') {
                    tr.lastChild.childNodes[1].classList.add('hide');
                    tr.lastChild.childNodes[2].classList.remove('hide');
                }
            });
        });

        // Added listener on selects
        Array.prototype.forEach.call(selects, (select) => {
            select.addEventListener('focus', function (event) {
                let status = event.target.parentNode.parentNode.parentNode.parentNode.lastChild;
                status.childNodes[0].classList.remove('hide');
            });
            select.addEventListener('blur', function (event) {
                let status = event.target.parentNode.parentNode.parentNode.parentNode.lastChild;
                status.childNodes[0].classList.add('hide');
            });
            select.childNodes[0].addEventListener('DOMSubtreeModified', function (event) {
                let tr = event.target.parentNode.parentNode.parentNode.parentNode.parentNode;
                if (tr.parentNode.tagName != 'TFOOT') {
                    // Errors comes when we change language that's why put conditions
                    if (tr.lastChild.childNodes[1]) {
                        tr.lastChild.childNodes[1].classList.add('hide');
                    }
                    if (tr.lastChild.childNodes[2]) {
                        tr.lastChild.childNodes[2].classList.remove('hide');
                    }
                }
            });
        });
    }

    /**
     * Delete Row
     * @param Accounts model
     * @param dataTable
     * @param table
     */
    this.deleteTableRow = function (Accounts, dataTable, table) {
        let rows = dataTable.querySelectorAll('.delete-row')

        // Added listener on rows
        Array.prototype.forEach.call(rows, (row) => {
            row.addEventListener('click', function (event) {
                const target = event.target;
                const a      = (target.tagName == 'I') ? target.parentNode : target;
                const id     = a.dataset.delete;

                if (confirm('Are you sure want to delete this record')) {
                    Accounts.deleteRow(table, id).then(function (result) {
                        if (table == 'cartage' || table == 'general') {
                            const tableId = (table == 'general') ? 'general-accounts' : 'cartage-billing';
                            const section = document.getElementById(tableId)
                            if (section) section.click()
                        } else {
                            a.parentNode.parentNode.remove();
                        }
                        showToast('Record deleted successfully')
                    })
                }
            });
        });
    }
}

const HtmlHelper = new HtmlHelperClass()