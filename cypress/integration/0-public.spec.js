context('Public pages', () => {

  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Simple visitor can visit public pages', () => {

    it('A visitor can visit the blog', () => {
      cy.visit('/blog')
      cy.get('h1').should('contain', 'blog')
    })
    it('A visitor can visit a blog article', () => {
      cy.visit('/blog/markdown-syntax')
      cy.get('h1').should('contain', 'Markdown Syntax')
    })
    it('A visitor can visit the about page', () => {
      cy.visit('/about')
      cy.get('h1').should('contain', 'About')
    })
    it('A visitor can visit the styleguide', () => {
      cy.visit('/styleguide')
      cy.get('h1').should('contain', 'Styleguide')
    })
    it('A visitor can visit the changelog', () => {
      cy.visit('/changelog')
      cy.get('h1').should('contain', 'Changelog')
    })
    it('A visitor can visit the pricing page', () => {
      cy.visit('/pricing')
      cy.get('h1').should('contain', 'plan')
    })
    it('A visitor can visit the credits page', () => {
      cy.visit('/credits')
      cy.get('h1').should('contain', 'Credits')
    })
    it('A visitor can visit the tags', () => {
      cy.visit('/blog/tags')
      cy.get('h1').should('contain', 'All tags')
    })
    it('A visitor can visit a tag', () => {
      cy.visit('/blog/tags/html')
      cy.get('h1').should('contain', 'HTML')
    })
    it('A visitor can visit the home page', () => {
      cy.visit('/')
      cy.get('h1').should('contain', 'Highlight')
    })
    it('A visitor can create an account', () => {
      cy.visit('/create-account')
      cy.get('h1').should('contain', 'Create account')
    })
    it('A visitor can login', () => {
      cy.visit('/login')
      cy.get('h1').should('contain', 'Sign in')
    })
    it('A visitor may require to reset the password', () => {
      cy.visit('/reset-password-request')
      cy.get('h1').should('contain', 'Get a new password')
    })
    it('A visitor may require to send the verification email again', () => {
      cy.visit('/verify-account-resend')
      cy.get('h1').should('contain', 'Send verification email again')
    })
  })
})
