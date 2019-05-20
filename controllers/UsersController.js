const User      = require('../models/User');
const serialize = require('node-serialize');
const moment    = require('moment');

class UserController {
    constructor(elementId) {
        showLoader();
        let id          = 0;
        [elementId, id] = UserController.getId(elementId, id);
        switch (elementId) {
            case 'user-index':
                return this.index()
            case 'user-add':
                return this.create()
            case 'user-edit':
                return this.edit(id)
            case 'user-profile':
                return this.profile(id)
            default:
                return console.log(123)
        }
    }

    static getId(elementId, id) {
        if (elementId.indexOf('user-edit') === 0 || elementId.indexOf('user-profile') === 0) {
            let idAry = elementId.split('-');
            id        = idAry.pop();
            elementId = idAry.join('-');
        }
        return [elementId, id];
    }

    index() {
        const tableId = '#user_list';
        User.getUsers().then(function (results) {
            let actions = '', dataSet = [];

            Array.prototype.forEach.call(results, (row) => {
                actions = HtmlHelper.getActionsBtnHtml('user', row.id)
                dataSet.push([row.name, row.user_name, moment(row.created_at).format('Do MMM YYYY hh:mm a'), actions]);
            })

            // Init Data Table
            HtmlHelper.initDataTable(tableId, dataSet, ['Name', 'User Name', 'Created', 'Actions'])
            UserController.destroy()
            hideLoader()
        })
    }

    profile(id) {
        let form = document.getElementById('user-profile-form')

        form.reset()

        User.getUser(id).then((result) => {
            result = result[0];
            setFormValues(form, result)

            hideLoader()
        })

        this.update(2);
    }

    edit(id) {
        let form = document.getElementById('user-edit-form')

        form.reset()

        User.getUser(id).then((result) => {
            result = result[0];
            setFormValues(form, result)

            this.getPermissions('user-edit-permissions', result)
            hideLoader()
        })

        this.update(1);
    }

    update(type) {

        let formId = (type == 1) ? 'user-edit-form' : 'user-profile-form'
        let form   = document.getElementById(formId)

        form.onsubmit = (evt) => {
            evt.preventDefault();
            showLoader();

            // Get form values input array
            let data = getFormValues(form);

            // Password Validation
            if (data['password'] != '' && data['password'] != data['confirm_password']) {
                showToast('Password not matched', 'danger')
                return false;
            }

            // verify user name is exist
            User.isUserNameExist(data['user_name'], data['id']).then(function (result) {
                if (result.length !== 0) {
                    showToast('Username already exist', 'danger')
                    return false;
                }
                // Update User
                User.updateUser(data).then(function (result) {
                    if (type == 1) {
                        const section = document.getElementById('user-index')
                        if (section) section.click()
                    } else {
                        hideLoader();
                    }

                    showToast(((type == 1) ? 'User' : 'Profile') + ' updated successfully')
                })
            })
        }
    }

    create() {
        let form = document.getElementById('user-add-form')
        form.reset()
        this.getPermissions('user-add-permissions', [])
        hideLoader()

        form.onsubmit = (evt) => {
            evt.preventDefault();
            showLoader();

            // Get form values input array
            let data = getFormValues(form);

            // Password Validation
            if (data['password'] != data['confirm_password']) {
                showToast('Password not matched', 'danger')
                return false;
            }

            // verify user name is exist
            User.isUserNameExist(data['user_name'], 0).then(function (result) {
                if (result.length !== 0) {
                    showToast('Username already exist', 'danger')
                    return false;
                }

                // Insert the user
                User.createUser(data).then(function (result) {
                    const section = document.getElementById('user-index')
                    if (section) section.click()

                    showToast('User created successfully')
                })
            })
        }
    }

    static destroy() {
        let table = document.getElementById('user_list')
        table.removeEventListener('click', UserController.destroyListener);
        table.addEventListener('click', UserController.destroyListener);
    }

    static destroyListener(event) {
        if (event.target.dataset.delete) {
            if (confirm('Are you sure want to delete this user')) {
                const id = event.target.dataset.delete;
                User.deleteUser(id).then(function (result) {
                    const section = document.getElementById('user-index')
                    if (section) section.click()

                    showToast('User deleted successfully')
                })
            }
        }
    }

    getPermissions(elementId, result) {

        // get serialize array
        if (result.length !== 0) {
            result = serialize.unserialize(result['permissions'])
        }

        let json     = userDefaultPremissions();
        let el       = document.getElementById(elementId);
        el.innerHTML = '';

        let checkbox, checkboxRight, permissions, checked;
        Object.keys(json).forEach(function (key) {

            // Checkbox Wrapper
            checkbox = '<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">' +
                       '<div class="form-group"><label>' + key.replace('-', ' ').ucwords() + '</label><div class="checkbox">';

            checkboxRight = checked = '';
            permissions = json[key];

            // Read Checkbox
            if (isset(permissions.read)) {
                checkboxRight = 'class="pull-right"';
                checked       = (result.length === 0) ? 'checked' : (isset(result[key]) ? ((result[key].read) ? 'checked' : '') : '')
                checkbox += '<label><input type="checkbox" class="permissions" name="' + key + '_read" value="1" ' + checked + '>Read</label>';
            }

            // Write Checkbox
            if (isset(permissions.write)) {
                checked = (result.length === 0) ? 'checked' : (isset(result[key]) ? ((result[key].write) ? 'checked' : '') : '')
                checkbox += '<label ' + checkboxRight + '><input type="checkbox" class="permissions" name="' + key + '_write" value="1" ' + checked + '>Write</label>';
            }

            checkbox += '</div></div></div>';

            el.innerHTML += checkbox
        });
    }
}

module.exports = UserController