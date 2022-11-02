defmodule CovidVaccinationApi.Persons.Delete do
  alias CovidVaccinationApi.{Error, Person, Repo}

  def call(uuid) do
    case Repo.get(Person, uuid) do
      nil -> {:error, Error.build_person_not_found()}
      person -> Repo.delete(person)
    end
  end
end
