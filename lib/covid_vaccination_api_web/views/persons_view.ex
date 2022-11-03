defmodule CovidVaccinationApiWeb.PersonsView do
  use CovidVaccinationApiWeb, :view
  alias CovidVaccinationApi.Person

  def render("create.json", %{person: %Person{} = person}) do
    %{message: "person created!", person: person}
  end

  def render("person.json", %{person: %Person{} = person}), do: %{person: person}
end
