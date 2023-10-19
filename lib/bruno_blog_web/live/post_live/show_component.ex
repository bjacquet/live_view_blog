defmodule BrunoBlogWeb.PostLive.ShowComponent do
  use BrunoBlogWeb, :live_component

  def render(assigns) do
    ~H"""
    <section id={"post_#{@post.id}"}>
      <section>
        <h1><%= @post.title %></h1>
      </section>
      <section>
        <p><%= @post.body %></p>
      </section>
      <section>
        <p><%= @post.username %>, <%= @post.inserted_at %></p>
      </section>
    </section>
    """
  end
end
