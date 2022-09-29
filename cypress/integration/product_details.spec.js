describe("Testing Home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("allows users to navigate from home page to product detail page by clicking on a product", () => {
    cy.get(".products article")
      .eq(1)
      .click()
      .then(() => {
        return ".product-detail";
      });
  });
});

// users can navigate from the home page to the product detail page by clicking on a product
// Make sure you start by visiting the home page and then click one of the product partials in order to navigate directly to a product detail page.