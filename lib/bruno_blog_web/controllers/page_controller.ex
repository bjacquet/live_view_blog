defmodule BrunoBlogWeb.PageController do
  use BrunoBlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
