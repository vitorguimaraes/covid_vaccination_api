defmodule CovidVaccinationApiWeb.Plugs.UUIDChecker do
  import Plug.Conn
  alias Ecto.UUID
  alias Plug.Conn

  def init(options), do: options

  def call(%Conn{params: %{"id" => uuid}} = conn, _opts) do
    case UUID.cast(uuid) do
      :error -> render_error(conn)
      {:ok, _uuid} -> conn
    end
  end

  def call(conn, _opts), do: conn

  defp render_error(conn) do
    body = Jason.encode!(%{message: "invalid uuid"})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(:bad_request, body)
    |> halt()
  end
end
