defmodule BpService.BusinessProcess do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  schema "business_processes" do
    field :description, :string
    field :name, :string
    field :public, :boolean
    field :tags, {:array, :string}
    field :status, :string
    field :content, :string

    timestamps()
  end

  @doc false
  def changeset(business_process, attrs) do
    business_process
    |> cast(attrs, [:name, :description, :public, :tags, :status, :content])
    |> validate_required([:name, :public, :status])
  end
end
