describe('Jungle app', () => {
  beforeEach(() => {
    
    cy.visit('http://localhost:3000')
  })
  
  it("There is 2 products on the page", () => {
  cy.get(".products article").should("have.length", 11);
});

})
