defmodule BrunoBlogWeb.PostLive.Index do
  use BrunoBlogWeb, :live_view

  alias BrunoBlog.Blog
  alias BrunoBlog.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    Blog.subscribe()

    {:ok, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  defp list_posts do
    Blog.list_posts()
    |> Enum.sort(fn a, b -> a.inserted_at >= b.inserted_at end)
  end

  @impl true
  def handle_info({:created_post, post}, socket) do
    {:noreply, assign(socket, :posts, fn posts -> [post | posts] end)}
  end
end
