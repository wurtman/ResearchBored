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


  describe('Manage blog articles', () => {
    it('An admin may list blog articles', () => {
      cy.visit('/admin')
      cy.get('.nav-link--articles').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/articles')})
    })
    it('An admin may create a blog article, but error occurs', () => {
      let green = 'rgb(49, 188, 96)'
      let red = 'rgb(227, 79, 47)'
      // Given
      cy.visit('/admin')
      cy.get('.nav-link--articles').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/articles')})
      cy.get('.action-create-item').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/articles/new')})
      cy.get('.ProseMirror').first().type('NewText{enter}')
      cy.get('#title-input').type('My article title').should('have.value', 'My article title')
      cy.get('#slug-input').type('my-article-title&').should('have.value', 'my-article-title&')
      cy.get('#description-input').type('A simple test article').should('have.value', 'A simple test article')
      cy.get('#is_published-input').click()
      // When
      cy.get('input[value="Create Article"]').click()
      // Then
      cy.get('.toast-body').should('contain', 'Article not created')
      cy.get('.toast .btn-close').click()
      // Non-error, but filled : green border
      cy.get('#description-input').should('have.css', 'border-color', green)
      cy.get('#description_message').should('contain', 'looks good')
      // Error, but filled : red border
      cy.get('#slug-input').should('have.css', 'border-color', red)
      cy.get('#slug_message').should('contain', 'invalid')

    })
    it('An admin may create a blog article successfully', () => {
      // Given
      cy.get('#slug-input').clear()
      cy.get('#slug-input').type('my-article-title').should('have.value', 'my-article-title')
      // When
      cy.get('input[value="Create Article"]').click()
      // Then
      cy.get('.toast-body').should('contain', 'Article was successfully created')
      cy.get('h1').should('contain', 'Show Article')
    })
    it('A created article is then listed at the /blog URL, can be publicly viewed, and also appears in sitemap and RSS feed', () => {
      cy.visit('/blog')
      // 1. New article is listed under /blog
      cy.get('.blog-card a[href="/blog/my-article-title"]').click()
      // 2. New article can be publicly viewed
      cy.location().should((location) => {expect(location.pathname).to.eq('/blog/my-article-title')})
      cy.get('h1').should('contain', 'My article title')
      cy.get('.blog-body').should('contain', 'NewText')
      // 3. New article can be shown in sitemap
      cy.request('sitemap.xml').its('body').should('include', 'my-article-title')
      // 4. New article can be shown in RSS feed
      cy.request('feed').its('body').should('include', 'my-article-title')
    })

  })

})
