import resetValidation from 'resetValidation.js'

describe('resetValidation', () => {

  beforeEach(() => {
    document.body.innerHTML =
      '<div id="root">' +
      '  <div id="not-yet-validated" class="form-control" />' +
      '  <input type="text" id="already-valid" class="form-control is-valid" />' +
      '  <input id="already-invalid" class="form-control is-invalid" />' +
      '</div>';
  });

  test('Will remove attributes if user changes an already validated input', () => {
    // given
    // when
    resetValidation()
    document.getElementById('already-valid').dispatchEvent(new KeyboardEvent('keyup'));
    document.getElementById('already-invalid').dispatchEvent(new KeyboardEvent('keyup'));
    // then
    expect(document.getElementById('already-valid').classList).not.toContain('is-valid');
    expect(document.getElementById('already-invalid').classList).not.toContain('is-invalid');
  });

})


