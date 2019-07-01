defmodule RumblWeb.UserController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
  alias Rumbl.Accounts.User
  alias Ecto.Changeset
  plug :authenticate when action in [:index, :show]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user(id)
    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Accounts.change_registration(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), map) :: Plug.Conn.t()
  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> RumblWeb.Auth.login(user)
        |> redirect(to: Routes.user_path(conn, :index))

      # TODO  handle error from unique usernames

      {:error, %Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "your form had errors")
        |> render("new.html", changeset: changeset)
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
