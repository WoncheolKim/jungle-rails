describe("Testing Home page", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000");
  });

  it("Display a title by default", () => {
    cy.get("h1").should("contain", "Jungle");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});