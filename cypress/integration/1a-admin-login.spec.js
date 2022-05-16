context('Log in into the admin dashboard', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Visit the admin part', () => {
    before(() => {
      cy.visit('/admin')
    })
    it('A non-connected visitor cannot visit the admin section', () => {
      cy.location().should((location) => {expect(location.pathname).to.eq('/login')})
    })
    it('A visitor can login and access to the admin section', () => {
      // Given
      cy.get('#login').type('admin@example.com').should('have.value', 'admin@example.com')
      cy.get('#password').type('Mysecret+1234').should('have.value', 'Mysecret+1234')
      // When
      cy.get('input[value="Login"]').click()
      cy.visit('/admin')
      // Then
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin')})
      cy.get('h1').should('contain', 'Welcome to the admin dashboard')
    })
  })





})
