defmodule Videoly.Repo do
  use Ecto.Repo,
    otp_app: :videoly,
    adapter: Ecto.Adapters.Postgres
end
