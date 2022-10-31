defmodule CovidVaccinationApi.Persons.Create do
  alias CovidVaccinationApi.{Repo, Person}

  def call(params) do
    params
    |> Person.changeset()
    |> Repo.insert()
  end
end
