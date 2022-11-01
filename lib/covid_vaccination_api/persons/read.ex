defmodule CovidVaccinationApi.Persons.Read do
  alias CovidVaccinationApi.{Error, Repo, Person}

  def by_id(uuid) do
    case Repo.get(Person, uuid) do
      nil -> {:error, Error.build_user_not_found()}
      user -> {:ok, user}
    end
  end
end
