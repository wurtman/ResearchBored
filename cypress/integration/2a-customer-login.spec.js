context('Customer pages', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Existing customer can login, logout', () => {

    it('Customer can login', () => {
      cy.visit('/login')
      cy.get('#login').type('customer@example.com').should('have.value', 'customer@example.com')
      cy.get('#password').type('Mysecret+1234').should('have.value', 'Mysecret+1234')
      cy.get('input[value="Login"]').click()
      cy.get('.toast-body').should('contain', 'You have been logged in')      
    })
    it('Once logged in, appropriate links are shown on landing page', () => {
      cy.visit('/')
      cy.get('.ms-auto.navbar-nav .nav-link').eq(0).should('have.text', 'Profile')      
      cy.get('.ms-auto.navbar-nav .nav-link').eq(1).should('have.value', 'Logout')      
    })
    it('Customer can log out', () => {
      cy.visit('/profile/danger')
      cy.get('.card input[value="Logout"]').click()
      cy.get('.toast-body').should('contain', 'You have been logged out')      
    })
    it('Once logged out, appropriate links are shown on landing page', () => {
      cy.visit('/')
      cy.get('.ms-auto.navbar-nav .nav-link').eq(0).should('have.text', 'Sign up')      
      cy.get('.ms-auto.navbar-nav .nav-link').eq(1).should('have.text', 'Sign in')      
    })

  })

})
