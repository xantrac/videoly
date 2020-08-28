defmodule Videoly.Calendly do
  use HTTPoison.Base

  # def process_request_url(url) do
  #   base_url = Application.get_env(:videoly, :CALENDLY_BASE_URL)
  #   IO.inspect(base_url)
  #   IO.inspect(url)
  #   base_url <> url
  # end

  def request(method, url, headers, body, opts) do
    IO.inspect(url)
    IO.inspect(headers)
    IO.inspect(body)
    IO.inspect(opts)
    super(method, url, headers, body, opts)
  end

  def update_event(event_uuid, meeting_url) do
    body = Jason.encode!(%{event_uuid: event_uuid, meeting_url: meeting_url})

    try do
      post!(
        "http://localhost:3000/webhooks/videoly/events",
        body,
        [{"Content-type", "application/json"}],
        timeout: 5_000,
        recv_timeout: 5_000,
        hackney: [pool: false],
        ssl: [{:versions, [:"tlsv1.2"]}]
      )
    rescue
      error ->
        IO.inspect(error)
    end
  end
end
