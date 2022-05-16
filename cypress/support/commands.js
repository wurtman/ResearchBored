// ***********************************************
// For more comprehensive examples of custom
// commands please read more here:
// https://on.cypress.io/custom-commands
// ***********************************************
Cypress.Commands.add('connect_as_superadmin', () => {
  cy.request('POST', '/login', { email: 'admin@example.com', password: 'Mysecret+1234' })
});
