defmodule VideolyWeb.PageController do
  use VideolyWeb, :controller

  def index(conn, params) do
    render(conn, "index.html")
  end

  def meet(conn, %{"room_uuid" => room_uuid}) do
    render(conn, "video_chat.html", %{room_uuid: room_uuid})
  end
end
