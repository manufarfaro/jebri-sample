// Namespaces
var Jebri = Jebri || {};
Jebri.defaultOptions = Jebri.defaultOptions || {};
Jebri.actions = Jebri.actions || {};

// Global options
Jebri.defaultOptions = {
    datatables: {
        sortable: true,
        paginate: false
    }
};

Jebri.actions.navbar = {
    ClickExpandToggle: function () {
        document.querySelector('.navbar-expand-toggle').addEventListener('click', function (event) {
            var targetElement = event.target || event.srcElement;
            var appContainerElement = document.querySelector('.app-container');
            appContainerElement.classList.toggle('expanded');
            return targetElement.classList.toggle('fa-rotate-90');
        });
    },
    ClickRightExpandToggle: function () {
        document.querySelector('.navbar-right-expand-toggle').addEventListener('click', function (event) {
            var targetElement = event.target || event.srcElement;
            var navbarRightElement = document.querySelector('.navbar-right');
            navbarRightElement.classList.toggle('expanded');
            return targetElement.classList.toggle('fa-rotate-90');
        });
    }
};

document.addEventListener('page:change', function() {
    Jebri.actions.navbar.ClickExpandToggle();
    Jebri.actions.navbar.ClickRightExpandToggle();
});

document.addEventListener("turbolinks:load", function() {
    Jebri.actions.navbar.ClickExpandToggle();
    Jebri.actions.navbar.ClickRightExpandToggle();

    $('.toggle-checkbox').bootstrapSwitch({
        size: "small"
    });

    $('.match-height').matchHeight();

});
