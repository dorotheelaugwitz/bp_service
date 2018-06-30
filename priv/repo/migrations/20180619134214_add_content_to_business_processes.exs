defmodule BpService.Repo.Migrations.AddContentToBusinessProcesses do
  @moduledoc false
  use Ecto.Migration

  def change do
    alter table(:business_processes) do
      add :content, :text
    end
  end
end
