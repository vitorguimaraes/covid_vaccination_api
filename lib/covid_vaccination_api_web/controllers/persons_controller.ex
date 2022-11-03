defmodule CovidVaccinationApiWeb.PersonsController do
  use CovidVaccinationApiWeb, :controller
  alias CovidVaccinationApi.Person

  def create(conn, params) do
    with {:ok, %Person{} = person} <- CovidVaccinationApi.create_person(params) do
      conn
      |> put_status(:created)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Person{} = person} <- CovidVaccinationApi.read_person_by_id(uuid) do
      conn
      |> put_status(:ok)
    end
  end

  def update(conn, params) do
    with {:ok, %Person{} = person} <- CovidVaccinationApi.update_person(params) do
      conn
      |> put_status(:ok)
    end
  end

  def delete(conn, %{"id" => uuid}) do
    with {:ok, %Person{}} <- CovidVaccinationApi.delete_person(uuid) do
      conn
      |> put_status(:no_content)
    end
  end
end
