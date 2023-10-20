defmodule BrunoBlogWeb.PostLive.Show do
  use BrunoBlogWeb, :live_view

  alias BrunoBlog.Blog

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      Blog.subscribe_posts()
      Blog.subscribe_comments()
    end

    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    post = Blog.get_post!(id)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:post, post)
     |> assign(:comments, post.comments)}
  end

  defp page_title(:show), do: "Show Post"
  defp page_title(:edit), do: "Edit Post"

  @impl true
  def handle_info({:created_post, post}, socket) do
    {:noreply, assign(socket, :post, fn posts -> [post | posts] end)}
  end

  @impl true
  def handle_info({:updated_post, post}, socket) do
    {:noreply, assign(socket, :post, fn post -> post end)}
  end

  @impl true
  def handle_info({:created_comment, comment}, socket) do
    {:noreply, assign(socket, :comments, fn comments -> [comment | comments] end)}
  end
end
