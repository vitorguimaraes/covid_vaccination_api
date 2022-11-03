defmodule CovidVaccinationApi do
  alias CovidVaccinationApi.Persons.Create, as: PersonCreate
  alias CovidVaccinationApi.Persons.Read, as: PersonRead
  alias CovidVaccinationApi.Persons.Update, as: PersonUpdate
  alias CovidVaccinationApi.Persons.Delete, as: PersonDelete

  defdelegate create_person(params), to: PersonCreate, as: :call
  defdelegate read_person_by_id(uuid), to: PersonRead, as: :by_id
  defdelegate update_person(params), to: PersonUpdate, as: :call
  defdelegate delete_person(uuid), to: PersonDelete, as: :call
end
