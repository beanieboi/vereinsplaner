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
  });
})();
