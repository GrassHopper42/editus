defmodule Editus.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      EditusWeb.Telemetry,
      # Start the Ecto repository
      Editus.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Editus.PubSub},
      # Start Finch
      {Finch, name: Editus.Finch},
      # Start the Endpoint (http/https)
      EditusWeb.Endpoint
      # Start a worker by calling: Editus.Worker.start_link(arg)
      # {Editus.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Editus.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EditusWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
