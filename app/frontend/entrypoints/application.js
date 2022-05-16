import * as bootstrap from "bootstrap";
import Bs5Utils from "bs5-utils";
import resetValidation from "../javascripts/resetValidation.js";

// Configure toasting
Bs5Utils.defaults.toasts.position = 'top-center';
Bs5Utils.defaults.toasts.container = 'toast-container';
Bs5Utils.defaults.toasts.stacking = true;

// Make Bs5Utils & bootstrap globally available
window.Bs5Utils = Bs5Utils;
window.bootstrap = bootstrap;

document.addEventListener("DOMContentLoaded", function(event) { 

  // Undraw validations once the user start to modify them
  let observer = new MutationObserver(function(mutations) {
    if (document.contains(document.querySelector('.form-control.is-valid')) || document.contains(document.querySelector('.form-control.is-invalid'))) {
      resetValidation();
    }
  });
  observer.observe(document, {attributes: false, childList: true, characterData: false, subtree: true});

  // Remove validation param from URL to allow a successful browser refresh
  let params = new URLSearchParams(location.search)
  if (Array.from(params).length) {
    params.delete('triggered_validation')
    history.replaceState(null, '', '?' + params + location.hash)    
  }

  // Bootstrap popover
  let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  // We don't use deprecated UJS, and we also don't use Hotwire, so let's prevent ourself double form submission
  // All Rails inputs related to a form submission have a "name" attribute with value "commit", so let's rely on it.
  const railsFormSubmits = document.querySelectorAll('input[name="commit"]');
  railsFormSubmits.forEach((railsFormSubmit) => {
    railsFormSubmit.setAttribute('onclick', "this.value = 'Please wait...'; this.disabled = true; form.submit();")
  });
});
