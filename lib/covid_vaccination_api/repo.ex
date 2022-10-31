defmodule CovidVaccinationApi.Repo do
  use Ecto.Repo,
    otp_app: :covid_vaccination_api,
    adapter: Ecto.Adapters.Postgres
end
