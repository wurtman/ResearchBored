const resetValidation = () => {

  let validateds = Array.prototype.slice.call(document.querySelectorAll('.form-control.is-valid'))
  let invalidateds = Array.prototype.slice.call(document.querySelectorAll('.form-control.is-invalid'))

  let validChanged = (e) => {
    e.target.classList.remove("is-valid");
    e.target.removeAttribute("aria-invalid");
    e.target.removeAttribute("aria-valid");
    e.target.removeAttribute("aria-describedby");
    e.target.removeEventListener("keyup", validChanged, true);
    e.target.removeEventListener("change", validChanged, true);
  }
  let invalidChanged = (e) => {
    e.target.classList.remove("is-invalid");
    e.target.removeAttribute("aria-valid");
    e.target.removeAttribute("aria-invalid");
    e.target.removeAttribute("aria-describedby");
    e.target.removeEventListener("keyup", invalidChanged, true);
    e.target.removeEventListener("change", invalidChanged, true);
  }

  if (validateds.length > 0) {
    validateds.forEach((validated) => {
      validated.addEventListener("keyup", validChanged, true);
      validated.addEventListener("change", validChanged, true);      
    })
  }
  if (invalidateds.length > 0) {
    invalidateds.forEach((invalidated) => {
      invalidated.addEventListener("keyup", invalidChanged, true);
      invalidated.removeEventListener("change", invalidChanged, true);
    })
  }

}


export default resetValidation;
