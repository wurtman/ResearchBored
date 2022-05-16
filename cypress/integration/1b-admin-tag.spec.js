context('Administrate tags', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
    cy.request('POST', '/login', {login: 'admin@example.com', password: 'Mysecret+1234'})
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Manage tags', () => {
    it('An admin may create tag, and link articles to this tag', () => {
      cy.visit('/admin/tags')
      cy.get('.action-create-item').click()
      cy.get('#shortname-input').type('a-tag-shortname').should('have.value', 'a-tag-shortname')
      cy.get('#display_name-input').type('My Tag').should('have.value', 'My Tag')
      cy.get('#description-input').type('A description about this tag').should('have.value', 'A description about this tag')
      cy.get('input[type="select-multiple"]').click()
      cy.get('#tag_article_ids-opt-1').click()
      cy.get('#tag_article_ids-opt-2').click()
      cy.get('input[value="Create Tag"]').click()
      cy.get('.toast-body').should('contain', 'Tag was successfully created.')
    })
    it('An admin may delete a tag', () => {
      cy.get('.admin-delete-item').click()
      cy.get('.toast-body').should('contain', 'Tag was successfully destroyed.')
    })
  })


})
