defmodule Videoly.RoomServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def create_room(meeting_uuid) do
    GenServer.call(__MODULE__, {:create_room, meeting_uuid})
  end

  def update_event(room_name) do
    GenServer.call(__MODULE__, {:update_event, room_name})
  end

  def init(rooms) do
    IO.inspect("RoomServer started....")
    {:ok, rooms}
  end

  def handle_call({:update_event, room_name}, _, rooms) do
    event_id = Map.get(rooms, room_name)
    base_url = Application.get_env(:videoly, :MEETING_BASE_URL)
    meeting_url = "#{base_url}/meet/#{room_name}"
    Videoly.Calendly.update_event(event_id, meeting_url)

    {:reply, :ok, rooms}
  end

  def handle_call({:create_room, meeting_uuid}, _, rooms) do
    uuid = Ecto.UUID.generate()
    response = Videoly.Twilio.create_room(uuid)
    IO.inspect(response)
    {:reply, :ok, Map.put(rooms, uuid, meeting_uuid)}
  end
end
