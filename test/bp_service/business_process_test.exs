defmodule BpService.BusinessProcessTest do
  @moduledoc false
  use BpService.DataCase

  alias BpService.BusinessProcess

  @valid_attrs %{
    name: "some name",
    public: true,
    status: "active",
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = BusinessProcess.changeset(%BusinessProcess{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = BusinessProcess.changeset(%BusinessProcess{}, @invalid_attrs)
    refute changeset.valid?
  end
end
