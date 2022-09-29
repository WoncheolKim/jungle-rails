describe("Testing Home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("allows users can click the 'Add to Cart' button for a product on the home page and in the cart increases by one", () => {
    cy.get(".btn").contains("Add").click({ force: true });
    cy.get(".nav-link").should("contain", 1);
  });
});