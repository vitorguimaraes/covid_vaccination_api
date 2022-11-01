defmodule CovidVaccinationApi.Error do
  @enforce_keys ~w(status result)a

  defstruct @enforce_keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_user_not_found, do: build(:not_found, "user not found")
end
