beforeEach(() =>
  cy.request("POST", "/sandbox").then(resp => {
    const token = resp.body;

    cy.server({
      onAnyRequest: (route, proxy) => {
        proxy.xhr.setRequestHeader("x-token", token);
      }
    });

    cy.route("GET", "*")
    cy.route("PUT", "*")
    cy.route("POST", "*")

    Cypress.env("token", token);
  })
);

afterEach(() =>
  cy.request({
    method: "DELETE",
    url: "/sandbox",
    headers: { "x-token": Cypress.env("token") }
  })
);
