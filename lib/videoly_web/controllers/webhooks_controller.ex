defmodule VideolyWeb.WebhooksController do
  use VideolyWeb, :controller

  def twilio(conn, params) do
    IO.inspect(params, "TWILIO")

    conn
    |> send_resp(200, "")
  end
end
