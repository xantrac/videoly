defmodule VideolyWeb.WebhooksController do
  use VideolyWeb, :controller

  def twilio(conn, %{
        "AccountSid" => _,
        "RoomName" => room_name,
        "RoomSid" => _,
        "RoomStatus" => _,
        "RoomType" => _,
        "SequenceNumber" => _,
        "StatusCallbackEvent" => "room-created",
        "Timestamp" => _
      }) do
    Videoly.RoomServer.update_event(room_name)

    conn
    |> send_resp(200, "")
  end

  def twilio(conn, _) do
    conn
    |> send_resp(200, "")
  end
end
