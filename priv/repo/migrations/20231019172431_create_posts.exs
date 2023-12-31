defmodule BrunoBlog.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string
      add :username, :string

      timestamps()
    end
  end
end
