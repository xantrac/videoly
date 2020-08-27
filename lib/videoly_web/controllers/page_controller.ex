defmodule VideolyWeb.PageController do
  use VideolyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
