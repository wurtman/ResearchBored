context('Administrate editables HTML parts', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
    cy.request('POST', '/login', {login: 'admin@example.com', password: 'Mysecret+1234'})
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Edit HTML', () => {
    it('An admin may change an editable, and view changes on the public website', () => {
      // Given
      cy.visit('/admin/editables')
      cy.get('.edit-editable-1').click()
      cy.location('pathname').should('include', '/admin/editables')
      cy.location('pathname').should('include', '/edit')
      // When
      cy.get('.ProseMirror').first().type('NewText{enter}')
      cy.get('input[value="Update Editable"]').click()
      // Then
      cy.get('h1').should('contain', 'Show Editable')
      cy.get('.toast-body').should('contain', 'Editable was successfully updated')
      cy.get('.actual-content').should('contain', 'NewText')
      cy.visit('/terms')
      cy.get('.page p').first().should('contain', 'NewText')
    })
  })


})
