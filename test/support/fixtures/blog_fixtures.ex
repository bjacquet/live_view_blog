defmodule BrunoBlog.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BrunoBlog.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title",
        username: "some username"
      })
      |> BrunoBlog.Blog.create_post()

    post
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        body: "some body",
        username: "some username"
      })
      |> BrunoBlog.Blog.create_comment()

    comment
  end
end
