defmodule VideolyWeb.RoomController do
  use VideolyWeb, :controller

  alias Videoly.Rooms
  alias Videoly.Rooms.Room

  action_fallback VideolyWeb.FallbackController

  def create(conn, %{"event_uuid" => event_uuid}) do
    IO.inspect("creating")
    :ok = Videoly.RoomServer.create_room(event_uuid)

    conn
    |> send_resp(201, "ok")
  end
end
