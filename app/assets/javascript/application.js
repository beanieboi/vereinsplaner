(function() {
  document.addEventListener("DOMContentLoaded", () => {
    const docInput = document.getElementById("document_file");
    const docInputLabel = document.getElementById("document_file_label");
    if (docInput && docInputLabel) {
      docInput.addEventListener("change", () => {
        const pathSegments = docInput.value.split("\\");
        if (pathSegments.length > 1) {
          docInputLabel.textContent = pathSegments[pathSegments.length - 1];
        } else {
          docInputLabel.textContent = docInput.value;
        }
      });
    }

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
