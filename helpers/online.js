const https = require('http');

onlineValidateClass = function () {

    /**
     * Get span cell
     * @returns {*}
     */
    this.init = function () {
        const thisClass = this;

        // Online
        window.addEventListener('online', function () {
            thisClass.translateOnline();
            thisClass.statusOnline();

            console.log('came online')
        });

        // Offline
        window.addEventListener('offline', function () {
            thisClass.translateOffline();
            thisClass.statusOffline();

            console.log('came offline');
        });

        // Default Online
        if (navigator.onLine == true) {
            thisClass.translateOnline();
            thisClass.statusOnline();

            console.log('default online')
        }
    }

    this.translateOnline = function () {
        document.getElementById('google_translate_element').removeAttribute('style');

        const url = document.getElementById('translate_url');
        if (url) {
            url.remove();
        }

        const body   = document.getElementsByTagName('body')[0];
        const script = document.createElement('script');
        script.id    = 'translate_url';
        script.src   = 'https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit';
        body.appendChild(script);
    }

    this.translateOffline = function () {
        const translator         = document.getElementById('google_translate_element');
        translator.style.display = 'none';
        translator.innerHTML     = '';
    }

    this.statusOnline = function () {
        const table = document.getElementById('status_system_information').children[0];
        const nav   = document.getElementById('nav_status');

        nav.innerHTML                           = '<i class="fa fa-circle text-success"></i> Online';
        table.children[0].children[1].innerHTML = '<i class="fa fa-circle text-success"></i> Online';
    }

    this.statusOffline = function () {
        const table = document.getElementById('status_system_information').children[0];
        const nav   = document.getElementById('nav_status');

        nav.innerHTML                           = '<i class="fa fa-circle text-danger"></i> Offline';
        table.children[0].children[1].innerHTML = '<i class="fa fa-circle text-danger"></i> Offline';
    }
}

const onlineValidate = new onlineValidateClass()
onlineValidate.init();