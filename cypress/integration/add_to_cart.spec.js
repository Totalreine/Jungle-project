describe('Jungle app', () => {
  beforeEach(() => {
    
    cy.visit('http://localhost:3000')
  })
  
  it("add product to cart and cart increases by one", () => {
  cy.get(".products article").first().contains('Add').click({force: true})
  cy.get('.nav-item.end-0').should('have.text', '\n           \n          My Cart (1) \n        ')
});

})
