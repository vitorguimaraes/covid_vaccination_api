defmodule CovidVaccinationApi.Persons.Update do
  alias CovidVaccinationApi.{Error, Person, Repo}

  def call(%{"id" => uuid} = fields) do
    case Repo.get(Person, uuid) do
      nil -> {:error, Error.build_person_not_found()}
      person_schema -> do_update(person_schema, fields)
    end
  end

  defp do_update(person_schema, fields) do
    person_schema
    |> Person.changeset(fields)
    |> Repo.update()
  end
end
