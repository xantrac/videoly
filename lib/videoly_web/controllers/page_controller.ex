defmodule VideolyWeb.PageController do
  use VideolyWeb, :controller

  def index(conn, params) do
    render(conn, "index.html")
  end

  def meet(conn, %{"meeting_uuid" => meeting_uuid}) do
    render(conn, "video_chat.html", %{meeting_uuid: meeting_uuid})
  end
end
