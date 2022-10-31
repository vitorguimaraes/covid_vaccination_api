defmodule CovidVaccinationApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CovidVaccinationApi.Repo,
      # Start the Telemetry supervisor
      CovidVaccinationApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CovidVaccinationApi.PubSub},
      # Start the Endpoint (http/https)
      CovidVaccinationApiWeb.Endpoint
      # Start a worker by calling: CovidVaccinationApi.Worker.start_link(arg)
      # {CovidVaccinationApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CovidVaccinationApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CovidVaccinationApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
