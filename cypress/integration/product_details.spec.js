describe('Jungle app', () => {
  beforeEach(() => {
    
    cy.visit('http://localhost:3000')
  })
  
  it("navigate from the home page to the product detail page", () => {
  cy.get(".products article").first().click()
});

})
