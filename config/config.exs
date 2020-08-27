# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :videoly,
  ecto_repos: [Videoly.Repo]

# Configures the endpoint
config :videoly, VideolyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CDo6TYrIAAEpaDx8AvNX0rxPr7buavclKJ3vhObEX4TiJ8XuYrAJakaUOruEqEu4",
  render_errors: [view: VideolyWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Videoly.PubSub,
  live_view: [signing_salt: "5mVyNlSe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
config :joken, default_signer: "secret"

import_config "#{Mix.env()}.exs"
