defmodule BpService.Repo.Migrations.AddTagsStatusPublicToBusinessProcesses do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:business_processes) do
      add :public, :boolean
      add :tags, {:array, :string}
      add :status, :string
    end
  end
end
