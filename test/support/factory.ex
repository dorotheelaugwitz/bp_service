defmodule BpService.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: BpService.Repo

  def business_process_factory do
    %BpService.BusinessProcess{
      name: "Example Process",
      description: "Example Process Description",
      public: true,
      tags: ["Tag0", "Tag1", "Tag3"],
      status: "active",
      content: elem(File.read("test/fixtures/bp_example.bpmn"), 1),
    }
  end
end
