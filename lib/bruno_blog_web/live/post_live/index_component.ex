defmodule BrunoBlogWeb.PostLive.IndexComponent do
  use BrunoBlogWeb, :live_component

  def render(assigns) do
    ~H"""
    <section id={"post_#{@post.id}"}>
      <section>
        <h3><%= live_redirect @post.title, to: Routes.post_show_path(@socket, :show, @post) %></h3>
      </section>
      <section>
        <p><%= String.slice(@post.body, 0..80) %>…</p>
      </section>
      <section>
        <p><%= @post.username %>, <%= @post.inserted_at %>, <%= Enum.count(@post.comments)%> comments</p>
      </section>
    </section>
    """
  end
end
