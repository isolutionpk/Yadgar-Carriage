const settings             = require('electron-settings');
const moment               = require('moment');
const middleware           = require('../helpers/middleware');
const AuthController       = require('../controllers/AuthController');
const StatusController     = require('../controllers/StatusController');
const StatusControllerObj  = new StatusController();
const ReportsController    = require('../controllers/ReportsController');
const ReportsControllerObj = new ReportsController();

document.body.addEventListener('click', (event) => {
    if (event.target.dataset.section) {
        handleSectionTrigger(event)
    } else if (event.target.dataset.modal) {
        handleModalTrigger(event)
    } else if (event.target.classList.contains('modal-hide')) {
        hideAllModals()
    } else if (event.target.getAttribute('id') == 'user-logout') {
        settings.delete('loggedUser')
        displayLogin()
    }
})

function handleSectionTrigger(event) {
    hideAllSectionsAndDeselectButtons()

    // Highlight clicked button and show view
    //event.target.classList.add('is-selected')
    event.target.parentNode.classList.add('active')

    // Run action on base of open section
    actionOnSection(event.target);

    new middleware();
    activeSectionsAfterLogged();

    // Display the current section
    const sectionId = `${event.target.dataset.section}-section`
    document.getElementById(sectionId).classList.add('is-shown')

    // Save currently active button in localStorage
    const buttonId = event.target.getAttribute('id')
    if (!buttonId.includes('edit') && !buttonId.includes('profile')) {
        settings.set('activeSectionButtonId', buttonId)
    }
}

function activeSectionsAfterLogged() {
    // Fix containers
    document.getElementById('login-section').classList.remove('is-shown')
    document.querySelector('body > .wrapper').classList.remove('hide')
    document.querySelector('body').className = 'hold-transition skin-green-light layout-top-nav'

    // Update logged information
    const loggedUser                                       = settings.get('loggedUser'), user = document.getElementById('user-logged-information');
    user.querySelector('a > span').innerHTML               = loggedUser.name
    // document.querySelector('.main-sidebar .info p').innerHTML = loggedUser.name
    document.querySelector('.user-footer .btn-profile').id = 'user-profile-' + loggedUser.id
    user.querySelector('.user-header > p').innerHTML       = loggedUser.name + ' - ' + loggedUser.user_name
                                                             + '<small>Member since ' + moment(loggedUser.created_at).format('MMM. YYYY') + '</small>';
}

function activateDefaultSection() {
    document.getElementById('dashboard').click()
}

function showMainContent() {
    //document.querySelector('.js-nav').classList.add('is-shown')
    document.querySelector('.js-content').classList.add('is-shown')
}

function handleModalTrigger(event) {
    hideAllModals()
    const modalId = `${event.target.dataset.modal}-modal`
    document.getElementById(modalId).classList.add('is-shown')
}

function hideAllModals() {
    const modals = document.querySelectorAll('.modal.is-shown')
    Array.prototype.forEach.call(modals, (modal) => {
        modal.classList.remove('is-shown')
    })
    showMainContent()
}

function hideAllSectionsAndDeselectButtons() {
    const sections = document.querySelectorAll('.js-section.is-shown')
    Array.prototype.forEach.call(sections, (section) => {
        section.classList.remove('is-shown')
    })

    const buttons = document.querySelectorAll('.nav-button.active')
    Array.prototype.forEach.call(buttons, (button) => {
        button.classList.remove('active')
    })
}

function displayLogin() {
    const section = document.getElementById('login-section')
    if (section) {
        section.classList.add('is-shown')
        document.querySelector('body > .wrapper').classList.add('hide')
        document.querySelector('body').className = 'hold-transition login-page'
        new AuthController()
    }
}

// Default to the view that was active the last time the app was open
const logged    = settings.has('loggedUser')
const sectionId = settings.get('activeSectionButtonId')
if (logged) {
    if (sectionId) {
        showMainContent()
        const section = document.getElementById(sectionId)
        if (section) section.click()
    } else {
        activateDefaultSection();
    }
} else {
    displayLogin();
}

function actionOnSection(target) {

    let id = target.getAttribute('id');

    if (id.indexOf('dashboard') === 0) {
        const DashboardController = require('../controllers/DashboardController');
        new DashboardController(id);
    } else if (id.indexOf('user-') === 0) {
        const UserController = require('../controllers/UsersController');
        new UserController(id);
    } else if (id.indexOf('account-') === 0) {
        const AccountsController = require('../controllers/AccountsController');
        new AccountsController(id);
    } else if (id.indexOf('purchases-') === 0) {
        const PurchasesController = require('../controllers/PurchasesController');
        new PurchasesController(id);
    } else if (id.indexOf('sales-') === 0) {
        const SalesController = require('../controllers/SalesController');
        new SalesController(id);
    } else if (id.indexOf('ledger-') === 0) {
        const LedgersController = require('../controllers/LedgersController');
        new LedgersController(id);
    } else if (id.indexOf('general-') === 0) {
        const GeneralController = require('../controllers/GeneralController');
        new GeneralController(id);
    } else if (id.indexOf('profit-loss') === 0) {
        const ProfitsController = require('../controllers/ProfitsController');
        new ProfitsController(id);
    } else if (id.indexOf('cartage-billing') === 0) {
        const CartageController = require('../controllers/CartageController');
        new CartageController(id);
    } else if (id.indexOf('cartage-documents') === 0) {
        const CartageController = require('../controllers/CartageDocumentsController');
        new CartageController(id);
    } else if (id.indexOf('reports') === 0) {
        ReportsControllerObj.init();
    } else if (id.indexOf('status') === 0) {
        StatusControllerObj.init();
    }
}