//= require rails-ujs

(function() {
  // toggle for mobile nav bar
  document.addEventListener("DOMContentLoaded", () => {
    var navBars = document.getElementsByClassName('navbar-toggler');
    if (navBars.length > 0) {
      navBars[0].addEventListener('click', function(event) {
        var target = event.target.dataset.target;
        if (!target) {
          target = event.target.parentElement.dataset.target;
        }
        if (target) {
          var navItems = document.getElementById(target);
          navItems.classList.toggle('collapse')
        }
      });
    }
  });
})();
