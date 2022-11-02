defmodule CovidVaccinationApi.Persons.Create do
  alias CovidVaccinationApi.{Repo, Person, Error}

  def call(params) do
    params
    |> Person.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Person{}} = result), do: result
  defp handle_insert({:error, changeset}), do: {:error, Error.build(:bad_request, changeset)}
end
