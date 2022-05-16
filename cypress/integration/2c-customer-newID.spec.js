
import { extractUrlFromEmail } from '../support/utils/common.js';

context('Customer pages', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
    cy.request('POST', '/login', {login: 'customer@example.com', password: 'Mysecret+1234'})
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Existing customer may change its ID', () => {

    it('Customer is on profile page, and requires a ID change', () => {
      cy.visit('/profile')
      cy.get('a.change-email-link').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/change-login')})
      cy.get('#login').type('newemail@example.com').should('have.value', 'newemail@example.com')
      cy.get('#password').type('Mysecret+1234').should('have.value', 'Mysecret+1234')
      cy.get('input[value="Change Login"]').click()
      cy.get('.toast-body').should('contain', 'An email has been sent to you with a link to verify your login change')      
    })
    it('Customer is on profile page, and requires a password change', () => {
      cy.visit('/profile')
      cy.get('a.change-password-link').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/change-password')})
      cy.get('#password').type('Mysecret+1234').should('have.value', 'Mysecret+1234')
      cy.get('#new-password').type('MLKJ0987+').should('have.value', 'MLKJ0987+')
      cy.get('#password-confirm').type('MLKJ0987+').should('have.value', 'MLKJ0987+')
      cy.get('input[value="Change Password"]').click()
      cy.get('.toast-body').should('contain', 'Your password has been changed')      
    })

  })

})
