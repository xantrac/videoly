defmodule Videoly.Calendly do
  use HTTPoison.Base

  # def process_request_url(url) do
  #   base_url = Application.get_env(:videoly, :CALENDLY_BASE_URL)
  #   IO.inspect(base_url)
  #   IO.inspect(url)
  #   base_url <> url
  # end

  def update_event(event_uuid, meeting_url) do
    body = Jason.encode!(%{event_uuid: event_uuid, meeting_url: meeting_url})
    post!("http://localhost:3000/webhooks/videoly/events", body)
    |> IO.inspect()
  end
end
