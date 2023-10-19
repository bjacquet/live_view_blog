defmodule BrunoBlog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :body, :string
    field :username, :string

    belongs_to :post, BrunoBlog.Blog.Post

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:body, :username])
    |> validate_required([:body, :username])
  end
end
