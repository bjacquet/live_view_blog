defmodule BrunoBlogWeb.CommentLive.ShowComponent do
  use BrunoBlogWeb, :live_component

  def render(assigns) do
    ~H"""
    <section id={"comment_#{@comment.id}"}>
      <section>
        <p><%= @comment.body %></p>
      </section>
      <section>
        <p><%= @comment.username %>, <%= @comment.inserted_at %></p>
      </section>
    </section>
    """
  end
end
