const Accounts  = require('../models/Accounts');
const serialize = require('node-serialize');
const settings  = require('electron-settings');
const moment    = require('moment');

class AccountsController {
    constructor(elementId) {
        showLoader();
        let id          = 0;
        [elementId, id] = AccountsController.getId(elementId, id);
        switch (elementId) {
            case 'account-index':
                return this.index()
            case 'account-add':
                return this.create()
            case 'account-edit':
                return this.edit(id)
            default:
                return console.log(123)
        }
    }

    static getId(elementId, id) {
        if (elementId.indexOf('account-edit') === 0) {
            let idAry = elementId.split('-');
            id        = idAry.pop();
            elementId = idAry.join('-');
        }
        return [elementId, id];
    }

    index() {
        const tableId = '#account_list';
        Accounts.getAllAccounts().then(function (results) {
            let dataSet = [];

            // Check the user role
            const user = settings.get('loggedUser');

            Array.prototype.forEach.call(results, (row) => {
                if (AccountsController.isRoleAdmin(user)) {
                    dataSet.push([
                        row.ac_id,
                        row.name,
                        getChartOfAccountsLabels(row.type),
                        moment(row.created_at).format('Do MMM YYYY hh:mm a'),
                        HtmlHelper.getActionsBtnHtml('account', row.id)
                    ]);
                } else {
                    dataSet.push([
                        row.ac_id,
                        row.name,
                        getChartOfAccountsLabels(row.type),
                        moment(row.created_at).format('Do MMM YYYY hh:mm a'),
                    ]);
                }
            })

            // Init Data Table
            if (AccountsController.isRoleAdmin(user)) {
                HtmlHelper.initDataTable(tableId, dataSet, ['A/C id', 'Name', 'Type', 'Created', 'Actions'])
            } else {
                HtmlHelper.initDataTable(tableId, dataSet, ['A/C id', 'Name', 'Type', 'Created'])
            }
            AccountsController.destroy()
            hideLoader()
        })
    }

    edit(id) {
        let form  = document.getElementById('account-edit-form')
        let types = document.getElementById('account-edit-types');

        form.reset()

        Accounts.getAccount(id).then((result) => {
            result = result[0];
            setFormValues(form, result)

            this.insertTypes(types, result['type']);
            this.updateAccountType(form, types);
            hideLoader()
        })

        this.update(form);
    }

    update(form) {
        form.onsubmit = (evt) => {
            evt.preventDefault();
            showLoader();

            // Get form values input array
            let data = getFormValues(form);

            // verify account id is exist
            Accounts.isAccountIdExist(data['ac_id'], data['id']).then(function (result) {
                if (result.length !== 0) {
                    showToast('Account Id already exist', 'danger')
                    return false;
                }
                // Update Account
                Accounts.updateAccount(data).then(function (result) {
                    const section = document.getElementById('account-index')
                    if (section) section.click()

                    showToast('Account updated successfully')
                })
            })
        }
    }

    create() {
        let form  = document.getElementById('account-add-form')
        let types = document.getElementById('account-add-types');

        this.insertTypes(types);
        this.updateAccountType(form, types);

        form.reset()

        hideLoader()

        form.onsubmit = (evt) => {
            evt.preventDefault();
            showLoader();

            // Get form values input array
            let data = getFormValues(form);

            if (data['ac_id'].indexOf(' ') >= 0) {
                showToast('A/C ID must not have space', 'danger')
                return false;
            }

            // verify account id is exist
            Accounts.isAccountIdExist(data['ac_id'], 0).then(function (result) {
                if (result.length !== 0) {
                    showToast('Account Id already exist', 'danger')
                    return false;
                }

                // Insert the account
                Accounts.createAccount(data).then(function (result) {
                    const section = document.getElementById('account-index')
                    if (section) section.click()

                    showToast('Account created successfully')
                })
            })
        }
    }

    insertTypes(types, active) {
        active = active || 1

        types.innerHTML = ''
        Array.prototype.forEach.call(getChartOfAccountsLabels(), (type, i) => {
            let li          = document.createElement('a');
            let span        = document.createElement('span');
            let icon        = span.cloneNode(true);
            li.dataset.type = i;
            li.className    = (i == active) ? 'active' : '';
            icon.className  = 'glyphicon ' + AccountsController.getIconType(i);
            span.className  = 'glyphicon-class';
            span.innerText  = type;
            li.appendChild(icon);
            li.appendChild(span);
            li.setAttribute('href', 'javascript:;');
            types.appendChild(li);
        })
    }

    static getIconType(i) {
        let glyphicon = 'glyphicon-folder-open'

        if (i == 1 || i == 2 || i == 6) {
            glyphicon = 'glyphicon-user'
        } else if (i == 3) {
            glyphicon = 'glyphicon-credit-card'
        } else if (i == 4) {
            glyphicon = 'glyphicon-usd'
        } else if (i == 5) {
            glyphicon = 'glyphicon-shopping-cart'
        } else if (i == 7) {
            glyphicon = 'glyphicon-road'
        } else if (i == 8) {
            glyphicon = 'fa fa-truck'
        } else if (i == 10) {
            glyphicon = 'glyphicon-wrench'
        }

        return glyphicon;
    }

    updateAccountType(form, types) {
        let hiddenType = form.querySelector('input[name=type]');
        types.addEventListener('click', (event) => {
            if (event.target.tagName == 'A') {
                hiddenType.value = event.target.dataset.type
                types.querySelector('a.active').classList.remove('active')
                event.target.classList.add('active')
            }
            if (event.target.tagName == 'SPAN') {
                hiddenType.value = event.target.parentNode.dataset.type
                types.querySelector('a.active').classList.remove('active')
                event.target.parentNode.classList.add('active')
            }
        })
        types.addEventListener('keypress', function (e) {
            let key = e.which || e.keyCode;
            if (key === 13) {
                hiddenType.value = event.target.dataset.type
                types.querySelector('a.active').classList.remove('active')
                event.target.classList.add('active')
            }
        });
    }

    static destroy() {
        let table   = document.getElementById('account_list')
        let buttons = table.querySelectorAll('.delete-account')

        Array.prototype.forEach.call(buttons, (button) => {
            button.addEventListener('click', (event) => {
                if (confirm('Are you sure want to delete this account')) {
                    const id = event.target.dataset.delete;
                    Accounts.deleteAccount(id).then(function (result) {
                        const section = document.getElementById('account-index')
                        if (section) section.click()

                        showToast('Account deleted successfully')
                    })
                }
            })
        })
    }

    static isRoleAdmin(user) {
        return (user.role == '21232f297a57a5a743894a0e4a801fc3')
    }
}

module.exports = AccountsController