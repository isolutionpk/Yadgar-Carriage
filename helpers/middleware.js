const settings = require('electron-settings');

class middleware {
    constructor() {
        const user = settings.get('loggedUser');
        middleware.users(user.role);

        if (isAdmin(user.role)) {
            user.permissions = userDefaultPremissions();
        }

        middleware.dayBook(isset(user.permissions.daybook) ? user.permissions.daybook : {});
        middleware.vehicle(user.permissions);
        middleware.accounts(isset(user.permissions.accounts) ? user.permissions.accounts : {});
        middleware.reports(isset(user.permissions.reports) ? user.permissions.reports : {});
    }

    static dayBook(permission) {
        const nav = document.getElementById('purchases-day-book');
        if (permission.read || permission.write) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
    }

    static vehicle(permission) {
        const nav       = document.getElementById('vehicle-tree-nav');
        const billing   = isset(permission.vehicleBilling) ? permission.vehicleBilling : {};
        const documents = isset(permission.vehicleDocuments) ? permission.vehicleDocuments : {};

        if (!billing.read && !billing.write && !documents.read && !documents.write) {
            nav.classList.add('hide');
        } else {
            nav.classList.remove('hide');

            // Billing
            const billingNav = document.getElementById('cartage-billing');
            if (billing.read || billing.write) {
                billingNav.classList.remove('hide');
            } else {
                billingNav.classList.add('hide');
            }

            // Documents
            const documentsNav = document.getElementById('cartage-documents');
            if (documents.read || documents.write) {
                documentsNav.classList.remove('hide');
            } else {
                documentsNav.classList.add('hide');
            }
        }
    }

    static accounts(permission) {
        const nav = document.getElementById('account-tree-nav');
        if (!permission.read && !permission.write) {
            nav.classList.add('hide');
        } else {
            nav.classList.remove('hide');

            const navRead  = document.getElementById('account-index');
            const navWrite = document.getElementById('account-add');
            if (permission.write) {
                navWrite.classList.remove('hide');
            } else {
                navWrite.classList.add('hide');
            }
            if (permission.read) {
                navRead.classList.remove('hide');
            } else {
                navRead.classList.add('hide');
            }
        }
    }

    static reports(permission) {
        const nav = document.getElementById('reports');
        if (permission.read) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
        const forms   = document.getElementById('reports-form');
        const buttons = forms.querySelectorAll('button');
        if (permission.write) {
            Array.prototype.forEach.call(buttons, (button) => {
                if (!button.getAttribute('id').match(/show/g)) {
                    button.classList.remove('hide');
                }
            })
        } else {
            Array.prototype.forEach.call(buttons, (button) => {
                if (!button.getAttribute('id').match(/show/g)) {
                    button.classList.add('hide');
                }
            })
        }
    }

    static users(role) {
        const nav = document.getElementById('user-tree-nav');
        if (isAdmin(role)) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
    }
}

module.exports = middleware