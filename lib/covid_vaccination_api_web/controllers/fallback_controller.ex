defmodule CovidVaccinationApiWeb.FallbackController do
  use CovidVaccinationApiWeb, :controller
  alias CovidVaccinationApiWeb.ErrorView
  alias CovidVaccinationApi.Error

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
