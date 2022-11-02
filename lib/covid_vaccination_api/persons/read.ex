defmodule CovidVaccinationApi.Persons.Read do
  alias CovidVaccinationApi.{Error, Repo, Person}

  def by_id(uuid) do
    case Repo.get(Person, uuid) do
      nil -> {:error, Error.build_person_not_found()}
      person -> {:ok, person}
    end
  end
end
