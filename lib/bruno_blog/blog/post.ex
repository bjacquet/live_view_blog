defmodule BrunoBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string
    field :username, :string

    has_many :comments, BrunoBlog.Blog.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :username])
    |> validate_required([:title, :body, :username])
    |> validate_length(:title, min: 3, max: 80)
    |> validate_length(:body, min: 3, max: 255)
  end
end
