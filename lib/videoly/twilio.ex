defmodule Videoly.Twilio do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://video.twilio.com/v1/" <> url
  end

  def create_room(name) do
    body =
      {:form,
       [
         UniqueName: name,
         Type: "peer-to-peer",
         statusCallbackMethod: "POST",
         StatusCallback: Application.get_env(:videoly, :TWILIO_WEBHOOK_URL)
       ]}

    post!("Rooms", body, headers())
  end

  defp headers() do
    api_key = Application.get_env(:videoly, :TWILIO_API_KEY)
    api_secret = Application.get_env(:videoly, :TWILIO_API_SECRET)
    encoded = Base.encode64("#{api_key}:#{api_secret}")
    [Authorization: "Basic #{encoded}"]
  end
end
