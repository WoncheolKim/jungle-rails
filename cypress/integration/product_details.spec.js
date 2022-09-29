describe("Testing Home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("allows users to navigate from home page to product detail page by clicking on a product", () => {
    cy.get(".products article").first().click();
    // .then(() => {
    // return ".product-detail";
    // });
    cy.get(".product-detail").should("have.length", 1);
  });
});
