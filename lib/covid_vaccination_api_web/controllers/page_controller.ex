defmodule CovidVaccinationApiWeb.PageController do
  use CovidVaccinationApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
