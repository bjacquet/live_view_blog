defmodule BrunoBlog.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :username, :string
      add :post_id, references(:posts)

      timestamps()
    end
  end
end
