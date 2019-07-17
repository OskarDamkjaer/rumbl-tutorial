describe("/users/new", () => {
  beforeEach(() => {
    cy.visit({
      url: "/users/new",
      headers: { "x-token": Cypress.env("token") }
    });
  });

  it("test", () => {
    cy.request({
      url: "/users/create",
      body: { username: "haj", user: "haj", password: "password" },
      headers: { "x-token": Cypress.env("token") }
    });
    cy.visit({
      url: "/users/new",
      headers: { "x-token": Cypress.env("token") }
    });

    const rnd = new Date().getTime();

    cy.get("#user_name").type(`test_name${rnd}`);
    cy.get("#user_username").type(`usr${rnd}`);
    cy.get("#user_password").type("password");
    cy.get("form").submit();

    cy.visit({
      url: "/users",
      headers: { "x-token": Cypress.env("token") }
    }); 
  });

  it("able to login", () => {
    const rnd = new Date().getTime();
    cy.get("#user_name").type(`test_name${rnd}`);
    cy.get("#user_username").type(`usr${rnd}`);
    cy.get("#user_password").type("password");
    cy.get("form").submit();
    cy.url("/users");
  });

  it("should require a username", () => {
    cy.get("#user_name").type("test_name");
    cy.get("#user_password").type("password");
    cy.get("form").submit();
    cy.get(".alert-danger");
  });

  it("should require a long password", () => {
    cy.get("#user_name").type("test_name");
    cy.get("#user_username").type("test_name");
    cy.get("#user_password").type("short");
    cy.get("form").submit();
    cy.get(".help-block").contains("character");
  });
});
