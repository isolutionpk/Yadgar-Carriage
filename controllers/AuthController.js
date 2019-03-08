const User      = require('../models/User');
const serialize = require('node-serialize');
const moment    = require('moment');
const settings  = require('electron-settings')

class AuthController {
    constructor() {
        this.update()
    }

    update() {
        let form = document.getElementById('login-form')

        form.onsubmit = (evt) => {
            evt.preventDefault();
            showLoader();

            // Get form values input array
            let data = getFormValues(form);

            // Validations Input Fields
            if (validateInputFields(data, ['user_name', 'password'])) {

                // verify user is valid
                User.isUserValid(data['user_name'], data['password']).then(function (result) {
                    if (result.length === 0) {
                        showToast('These credentials do not match our records.', 'danger')
                        return false;
                    }

                    let loggedUser            = result[0];
                    loggedUser['permissions'] = serialize.unserialize(loggedUser['permissions']);
                    settings.set('loggedUser', loggedUser)

                    hideLoader();

                    const section = document.getElementById('dashboard')
                    if (section) section.click()
                })
            } else {
                hideLoader();
            }
        }
    }
}

module.exports = AuthController