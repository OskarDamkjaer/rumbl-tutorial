defmodule Rumbl.Accounts do
  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Oskar Damkjaer", username: "one_screen"},
      %User{id: "2", name: "Marcel", username: "bitcoin_life"},
      %User{id: "3", name: "Kai Michels", username: "warm_car"},
      %User{id: "4", name: "Tim", username: "tech_lead"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn user -> user.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn user ->
      Enum.all?(params, fn {key, val} -> Map.get(user, key == val) end)
    end)
  end
end
