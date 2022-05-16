context('Administrate blog articles', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
    cy.request('POST', '/login', {login: 'admin@example.com', password: 'Mysecret+1234'})
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Manage blog articles, draft only', () => {

    it('An admin may create an unpublished blog article (draft) successfully', () => {
      cy.visit('/admin/articles/new')
      cy.get('.ProseMirror').first().type('NewText{enter}')
      cy.get('#title-input').type('A draft').should('have.value', 'A draft')
      cy.get('#slug-input').type('a-draft').should('have.value', 'a-draft')
      cy.get('#description-input').type('A not-ready-to-be-published article').should('have.value', 'A not-ready-to-be-published article')
      // When
      cy.get('input[value="Create Article"]').click()
      // Then
      cy.get('.toast-body').should('contain', 'Article was successfully created')
      cy.visit('/blog/a-draft')
      cy.get('.blog-title').should('contain', 'A draft')
    })
    it('If the admin decides to deactivate shareable drafts, then the draft cannot be publicly seen anymore for anyone who knows the URL', () => {
      cy.visit('/admin/settings')
      cy.get('#setting_shareable_draft').click()
      cy.get('input[value="Save"]').click()
    })
    it('The draft then cannot be publicly seen', () => {
      cy.request({method: 'GET', url: '/blog/a-draft', failOnStatusCode: false})
        .its('body').should('include', 'Not Found')
    })

  })

})
