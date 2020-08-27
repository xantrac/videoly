defmodule VideolyWeb.TokensController do
  use VideolyWeb, :controller

  def generate(conn, %{"username" => username, "roomname" => room}) do
    token = tokenize(username, room)
    text conn, token
  end

  def tokenize(username, room) do
    sid = Application.get_env(:videoly, :TWILIO_ACCOUNT_SID)
    api_key = Application.get_env(:videoly, :TWILIO_API_KEY)
    api_secret = Application.get_env(:videoly, :TWILIO_API_SECRET)
    now = epoch_ts()
    exp = now + 3600

    payload = %{
      "jti" => "#{api_key}-#{now}",
      "iss" => api_key,
      "sub" => sid,
      "exp" => exp,
      "grants" => %{
        "identity" => username,
        video: %{
          room: room
        }
      }
    }

    signer = Joken.Signer.create("HS256", api_secret, %{"cty" => "twilio-fpa;v=1"})
    {:ok, token, _claims} = Joken.encode_and_sign(payload, signer)

    token
  end

  defp epoch_ts() do
    epoch = {{1970, 1, 1}, {0, 0, 0}}
    epoch_i = :calendar.datetime_to_gregorian_seconds(epoch)
    now_i = :calendar.datetime_to_gregorian_seconds(:calendar.universal_time())
    now_i - epoch_i
  end
end
