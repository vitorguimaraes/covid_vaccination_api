defmodule CovidVaccinationApi.Repo.Migrations.CreatePersonsTable do
  use Ecto.Migration

  def change do
    create table :persons do
      add :name, :string, size: 100
      add :birth, :date
      add :cpf, :string, size: 11
      add :mother_name, :string, size: 100
      add :genre, :string, size: 1
      add :email, :string, size: 150
      add :password, :string

      timestamps()
    end

    create unique_index(:persons, [:cpf])
    create unique_index(:persons, [:email])
  end
end
