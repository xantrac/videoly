defmodule Videoly.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Videoly.Repo,
      # Start the Telemetry supervisor
      VideolyWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Videoly.PubSub},
      # Start the Endpoint (http/https)
      VideolyWeb.Endpoint
      # Start a worker by calling: Videoly.Worker.start_link(arg)
      # {Videoly.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Videoly.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    VideolyWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
