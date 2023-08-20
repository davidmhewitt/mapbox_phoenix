defmodule MapboxPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MapboxPhoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: MapboxPhoenix.PubSub},
      # Start Finch
      {Finch, name: MapboxPhoenix.Finch},
      # Start the Endpoint (http/https)
      MapboxPhoenixWeb.Endpoint
      # Start a worker by calling: MapboxPhoenix.Worker.start_link(arg)
      # {MapboxPhoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MapboxPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MapboxPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
