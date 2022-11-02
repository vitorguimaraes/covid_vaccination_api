defmodule CovidVaccinationApi.Persons.Update do
  alias CovidVaccinationApi.{Error, Person, Repo}

  def call(%{"id" => id} = fields) do
    case Repo.get(Person, id) do
      nil -> {:error, Error.build_user_not_found()}
      person -> do_update(person, fields)
    end
  end

  defp do_update(person, fields) do
    person
    |> Person.changeset(fields)
    |> Repo.update()
  end
end
