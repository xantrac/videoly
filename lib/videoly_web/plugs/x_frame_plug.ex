defmodule VideolyWeb.Plugs.XFramePlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    Plug.Conn.delete_resp_header(conn, "x-frame-options")
  end
end
