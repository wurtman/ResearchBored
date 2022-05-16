context('Admin : monitor the application', () => {


  before(() => {
    cy.clearCookie('_bootrails_session')
    cy.clearCookie('remember_token')
    cy.request('/cypress_rails_reset_state')
    cy.request('POST', '/login', {login: 'admin@example.com', password: 'Mysecret+1234'})
  })
  beforeEach(() => {
    Cypress.Cookies.preserveOnce('_bootrails_session', 'remember_token')
  })


  describe('Monitoring', () => {
    it('An admin may monitor the app', () => {
      cy.visit('/admin/monitoring')
      cy.get('a.monitor-jobs').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/monitor/jobs')})
      cy.get('.navbar-brand').should('contain', 'Sidekiq')
    })
    it('An admin may launch helloworld job', () => {
      cy.visit('/admin/monitoring')
      cy.get('.launch-helloworld-job').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/helloworld_job')})
      cy.get('h1').should('contain', 'HelloWorld job was triggered')
    })
    it('An admin may manage SQL', () => {
      cy.visit('/admin/monitoring')
      cy.get('.view-sql').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/monitor/db')})
      cy.get('#main_content p').first().should('contain', 'Welcome, in Rails DB')
    })
    it('An admin may try to migrate data', () => {
      cy.visit('/admin/monitoring')
      cy.get('.migrate-data').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/migrate_data')})
    })
    it('An admin may view various versions', () => {
      cy.visit('/admin/monitoring')
      cy.get('.show-versions').click()
      cy.location().should((location) => {expect(location.pathname).to.eq('/admin/versions')})
    })
  })

})
