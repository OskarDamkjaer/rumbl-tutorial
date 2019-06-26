defmodule Rumbl.Accounts.User do
  use Ecto.Schema
  alias Ecto.Changeset
  import Ecto.Changeset

  schema "users" do
    field(:name, :string)
    field(:username, :string)
    field(:password, :string, virtual: true)
    field(:hashed_password, :string)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password], [])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  def put_pass_hash(changeset = %Changeset{valid?: true, changes: %{password: pass}}) do
    put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
  end

  def put_pass_hash(changeset = %Changeset{valid?: false}) do
    changeset
  end
end
