
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


  describe('Existing customer may have forgot password', () => {

    it('Customer is on login page, and requires a password reset', () => {
      cy.visit('/login')
      cy.get('a.forgot-password-link').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/reset-password-request')})
      cy.get('#login').type('customer@example.com').should('have.value', 'customer@example.com')
      cy.get('input[value="Request Password Reset"]').click()
      cy.get('.toast-body').should('contain', 'An email has been sent to you with a link to reset the password for your account')      
    })
    it('The new customer can follow the sent link', async () => {
      const response = await cy.request('/get_last_email')
      const urlInEmail = extractUrlFromEmail(response)
      cy.visit(urlInEmail)
      cy.location().should((location) => {expect(location.pathname).to.eq('/reset-password')})
      cy.get('#password').type('Abcdef-6390').should('have.value', 'Abcdef-6390')
      cy.get('#password-confirm').type('Abcdef-6390').should('have.value', 'Abcdef-6390')
      cy.get('input[value="Reset Password"]').click()
      cy.get('.toast-body').should('contain', 'Your password has been reset')      
    })

  })

})
