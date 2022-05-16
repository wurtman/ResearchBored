import { extractUrlFromEmail } from '../support/utils/common.js';

context('Customer pages', () => {

  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Simple visitor can become a customer', () => {

    it('A visitor can create an account', () => {
      cy.visit('/create-account')
      cy.get('#login').type('new@customer.com').should('have.value', 'new@customer.com')
      cy.get('#password').type('Mysecret+6310').should('have.value', 'Mysecret+6310')
      cy.get('#password-confirm').type('Mysecret+6310').should('have.value', 'Mysecret+6310')
      cy.get('input[value="Create Account"]').click()
      cy.get('.toast-body').should('contain', 'An email has been sent to you with a link to verify your account')      
    })

    it('The new customer can verify its account', async () => {
      const response = await cy.request('/get_last_email')
      const urlInEmail = extractUrlFromEmail(response)
      cy.visit(urlInEmail)
      cy.location().should((location) => {expect(location.pathname).to.eq('/verify-account')})
      cy.get('input[value="Verify Account"]').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/profile')})
    })

    it('The new customer can destroy its account', async () => {
      cy.visit('/profile/danger')
      cy.get('input[value="Close Account"]').click()
      cy.get('#password').type('Mysecret+6310').should('have.value', 'Mysecret+6310')
      cy.get('input[value="Close Account"]').click()
      cy.get('.toast-body').should('contain', 'Your account has been closed')      
    })

  })

})
