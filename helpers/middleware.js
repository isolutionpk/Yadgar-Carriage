const settings = require('electron-settings');

class middleware {
    constructor() {
        const user = settings.get('loggedUser');
        middleware.users(user.role);

        if (user.permissions.purchases) {
            //middleware.purchases(user.role, user.permissions.purchases);
        }
        if (user.permissions.sales) {
           // middleware.sales(user.role, user.permissions.sales);
        }
        if (user.permissions.ledger) {
            //middleware.ledger(user.role, user.permissions.ledger);
        }
        if (user.permissions.general) {
           // middleware.general(user.role, user.permissions.general);
        }
        if (user.permissions.profitsAndLoss) {
            // middleware.profitAndLoss(user.role, user.permissions.profitsAndLoss);
        }
        if (user.permissions.daybook) {
            middleware.dayBook(user.role, user.permissions.daybook);
        }
        if (user.permissions.cartageBilling) {
            middleware.vehicle(user.role, user.permissions.cartageBilling);
        }
        if (user.permissions.cartageDocuments) {
            middleware.vehicle(user.role, user.permissions.cartageDocuments);
        }
        if (user.permissions.accounts) {
            middleware.accounts(user.role, user.permissions.accounts);
        }
        if (user.permissions.reports) {
            middleware.reports(user.role, user.permissions.reports);
        }
    }

    // static purchases(role, permission) {
    //     const nav = document.getElementById('purchases-accounts');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }
    //
    // static sales(role, permission) {
    //     const nav = document.getElementById('sales-accounts');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }
    //
    // static ledger(role, permission) {
    //     const nav = document.getElementById('ledger-accounts');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }
    //
    // static general(role, permission) {
    //     const nav = document.getElementById('general-accounts');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }

    // static profitAndLoss(role, permission) {
    //     const nav = document.getElementById('profit-loss');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }

    // static cartageBilling(role, permission) {
    //     const nav = document.getElementById('cartage-billing');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }
    //
    // static cartageDocuments(role, permission) {
    //     const nav = document.getElementById('cartage-documents');
    //     if (middleware.isRoleAdmin(role) || permission.write) {
    //         nav.classList.remove('hide');
    //     } else {
    //         nav.classList.add('hide');
    //     }
    // }

    static dayBook(role, permission) {
        const nav = document.getElementById('purchases-day-book');
        if (middleware.isRoleAdmin(role) || permission.write) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
    }

    static vehicle(role, permission) {
        const nav = document.getElementById('vehicle-tree-nav');
        if (!middleware.isRoleAdmin(role) && (!permission.read) && permission.write == permission.read) {
            nav.classList.add('hide');
        } else {
            nav.classList.remove('hide');

            const navRead  = document.getElementById('account-index');
            const navWrite = document.getElementById('account-add');
            if (middleware.isRoleAdmin(role) || permission.write) {
                navWrite.classList.remove('hide');
            } else {
                navWrite.classList.add('hide');
            }
            if (middleware.isRoleAdmin(role) || permission.read) {
                navRead.classList.remove('hide');
            } else {
                navRead.classList.add('hide');
            }
        }
    }

    static accounts(role, permission) {
        const nav = document.getElementById('account-tree-nav');
        if (!middleware.isRoleAdmin(role) && (!permission.read) && permission.write == permission.read) {
            nav.classList.add('hide');
        } else {
            nav.classList.remove('hide');

            const navRead  = document.getElementById('account-index');
            const navWrite = document.getElementById('account-add');
            if (middleware.isRoleAdmin(role) || permission.write) {
                navWrite.classList.remove('hide');
            } else {
                navWrite.classList.add('hide');
            }
            if (middleware.isRoleAdmin(role) || permission.read) {
                navRead.classList.remove('hide');
            } else {
                navRead.classList.add('hide');
            }
        }
    }


    static reports(role, permission) {
        const nav = document.getElementById('reports');
        if (middleware.isRoleAdmin(role) || permission.read) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
    }

    static users(role) {
        const nav = document.getElementById('user-tree-nav');
        if (middleware.isRoleAdmin(role)) {
            nav.classList.remove('hide');
        } else {
            nav.classList.add('hide');
        }
    }

    static isRoleAdmin(role) {
        return (role == '21232f297a57a5a743894a0e4a801fc3')
    }
}

module.exports = middleware