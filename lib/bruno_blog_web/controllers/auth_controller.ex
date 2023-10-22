defmodule BrunoBlogWeb.AuthController do
  use BrunoBlogWeb, :controller

  plug Ueberauth

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{
      email: auth.info.email,
      token: auth.credentials.token
    }

    User.changeset(%User{}, user_params)
    |> insert_or_update_user(changeset)
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      user ->
        {:ok, user}
      nil ->
        Repo.insert(changeset)
    end
  end
end
