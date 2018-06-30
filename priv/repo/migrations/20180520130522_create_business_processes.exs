defmodule BpService.Repo.Migrations.CreateBusinessProcesses do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:business_processes) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
