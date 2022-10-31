defmodule CovidVaccinationApi.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_fields ~w(name birth cpf mother_name genre email password)a

  @derive {Jason.Encoder, only: ~w(name birth cpf mother_name genre email)a}

  schema "persons" do
    field :name, :string
    field :birth, :date
    field :cpf, :string
    field :mother_name, :string
    field :genre, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  def changeset(schema \\ %__MODULE__{}, fields) do
    schema
    |> cast(fields, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:cpf])
    |> unique_constraint([:email])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    hash = Pbkdf2.add_hash(password)
    change(changeset, password: hash.password_hash)
  end

  defp put_password_hash(changeset), do: changeset
end
