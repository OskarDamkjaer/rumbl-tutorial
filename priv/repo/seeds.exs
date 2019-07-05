alias Rumbl.Accounts
alias Rumbl.Multimedia

users = [
  %{name: "Oskar Damkjaer", username: "one_screen", password: "password"},
  %{name: "Marcel", username: "bitcoin_life", password: "password"},
  %{name: "Kai Michels", username: "warm_car", password: "password"},
  %{name: "Tim", username: "tech_lead", password: "password"}
]

Enum.each(users, fn usr -> Accounts.register_user(usr) end)

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Multimedia.create_category!(category)
end
