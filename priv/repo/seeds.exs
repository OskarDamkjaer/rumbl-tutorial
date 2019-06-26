alias Rumbl.Repo
alias Rumbl.Accounts.User

users = [
    %User{name: "Oskar Damkjaer", username: "one_screen"},
    %User{name: "Marcel", username: "bitcoin_life"},
    %User{name: "Kai Michels", username: "warm_car"},
    %User{name: "Tim", username: "tech_lead"}
]


Enum.each(users, fn usr -> Repo.insert!(usr) end)
