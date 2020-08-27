defmodule Videoly.RoomServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def create_room(meeting_uuid) do
    GenServer.call(__MODULE__, {:create_room, meeting_uuid})
  end

  def init(rooms) do
    IO.inspect("RoomServer started....")
    {:ok, rooms}
  end

  def handle_call({:create_room, meeting_uuid}, _, rooms) do
    uuid = Ecto.UUID.generate()
    response = Videoly.Twilio.create_room(uuid)
    IO.inspect(response)
    {:reply, :ok, Map.put(rooms, uuid, meeting_uuid)}
  end
end
