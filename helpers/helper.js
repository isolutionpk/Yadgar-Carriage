/**
 * Looking is value is set or not null
 * @param value
 * @returns {*}
 */
function isset(value) {
    if (typeof value == 'undefined' || value == null) {
        return false;
    }
    return value;
}

String.prototype.ucfirst = function () {
    return this.charAt(0).toUpperCase() + this.slice(1)
}

String.prototype.ucwords = function () {
    let str = this.trim();
    return str.replace(/(^([a-zA-Z\p{M}]))|([ -][a-zA-Z\p{M}])/g, function (s) {
        return s.toUpperCase();
    });
}

function showToast(message, className) {
    // Define className name
    className = className || '';

    if (className == 'danger') {
        hideLoader();
    }

    // Get the snackbar DIV
    let x = document.getElementById('toast');

    // Add the "message" and className to SPAN
    x.childNodes[0].innerHTML = message;
    x.childNodes[0].className = className;

    // Add offset to get message box in center
    //let offset                       = document.querySelector('.main-sidebar').offsetWidth;
    //x.childNodes[0].style.marginLeft = offset / 2 + 'px';

    // Add the "show" class to DIV
    x.classList.add("show");

    // After 3 seconds, remove the show class from DIV
    setTimeout(function () {
        x.className = x.className.replace("show", "");
    }, 3000);
}

function showLoader() {
    let x                            = document.getElementById('loader');
    //let offset                       = document.querySelector('.main-sidebar').offsetWidth;
    //x.childNodes[0].style.marginLeft = offset / 2 + 'px';
    x.classList.add("show");
}

function hideLoader() {
    document.getElementById('loader').classList.remove("show");
}

/**
 * Convert bool/sting/integer into bool
 *
 * @param value
 * @returns {boolean}
 */
function convert2Bool(value) {
    if (typeof(value) === 'string') {
        value = value.trim().toLowerCase();
    }
    switch (value) {
        case true:
        case "true":
        case 1:
        case "1":
        case "on":
        case "yes":
            return true;
        default:
            return false;
    }
}

/**
 * Set Values in Form
 *
 * @param form
 * @param result
 */
function setFormValues(form, result) {

    // Get All inputs from form
    const inputs = form.querySelectorAll('input');

    Array.prototype.forEach.call(inputs, (input) => {

        // check if value exist
        const value = result[input.getAttribute('name')];

        // check if input is fillable
        let fillable = isset(input.dataset.fillable) ? input.dataset.fillable : true;

        // fill the the value in input
        if (value && convert2Bool(fillable)) {
            input.value = value;
        }
    })
}

/**
 * Get values from Form and convert into array
 *
 * @param form
 */
function getFormValues(form) {

    // Get All inputs from form
    const inputs = form.querySelectorAll('input');

    let data = [];
    Array.prototype.forEach.call(inputs, (input) => {

        // Checking if permissions coming inside the form
        if (input.classList.contains('permissions')) {
            getFormPermissions(input, data);
        } else {
            data[input.name] = input.value.trim();
        }
    })

    // Get All select from form
    const selects = form.querySelectorAll('select');
    Array.prototype.forEach.call(selects, (select) => {
        data[select.name] = select.value.trim();
    })

    return data;
}

/**
 * validation if value all filled
 *
 * @param data
 * @param fields
 */
function validateInputFields(data, fields) {
    fields     = Array.isArray(fields) ? fields : [fields];
    let result = true;

    for (const row in data) {
        if (data.hasOwnProperty(row)) {
            if (data[row] == '' && fields.includes(row)) {
                showToast(row.replace('_', ' ').ucwords() + ' field are required', 'danger')
                result = false;
            }
        }
        if (!result) {
            break;
        }
    }

    return result;
}

/**
 * Get Permissions from Form
 *
 * @param input
 * @param data
 */
function getFormPermissions(input, data) {
    if (!isset(data['permissions'])) {
        data['permissions'] = [];
    }

    let nameAry = input.name.split('_');
    let keyword = nameAry.shift();
    let elName  = nameAry.join('_');

    if (!isset(data['permissions'][keyword])) {
        data['permissions'][keyword] = [];
    }
    data['permissions'][keyword][elName] = !!(input.checked);
}

function getChartOfAccountsLabels(index) {
    index = index || 0;

    let charts = [];

    charts[1]  = 'Customer';
    charts[2]  = 'Supplier';
    charts[3]  = 'Bank';
    charts[4]  = 'Income/Expense';
    charts[5]  = 'Product';
    charts[6]  = 'Employee';
    charts[7]  = 'Terminal';
    charts[8]  = 'Tank Lorry';
    charts[9]  = 'Sub Ledger';
    charts[10] = 'Parts';
    charts[11] = 'General';
    charts[12] = 'Temp A/C';

    if (index != 0 && isset(charts[index])) {
        return charts[index];
    }

    return charts;
}


function isConnected(connection) {
    if (connection.state == 'disconnected') {
        return false;
    }
    return true;
}