defmodule BpServiceWeb.BusinessProcessControllerTest do
  @moduledoc false
  use BpServiceWeb.ConnCase
  import BpService.Factory
  alias BpService.Repo
  alias BpService.BusinessProcess

  describe "#index/2" do
    test "returns a list of business processes as json", %{conn: conn}  do
      business_process = insert(:business_process)

      response =
        conn
        |> get(business_process_path(conn, :index))
        |> json_response(200)

      assert response == %{
        "business_processes" => [as_json_response(business_process)]
      }
    end
  end

  describe "#show/2" do
    test "returns a specific business process as json", %{conn: conn}  do
      expected_business_process = insert(:business_process)
      _other_business_process = insert(:business_process)

      response =
        conn
        |> get(business_process_path(conn, :show, expected_business_process.id))
        |> json_response(200)

      assert response == as_json_response(expected_business_process)
    end
  end

  describe "#create/2" do
    test "returns a newly created business process as json", %{conn: conn}  do
      attributes = %{
        name: "bp_name",
        description: "bp_description",
        tags: ["tag1", "tag2"],
        status: "active",
        public: false,
        content: elem(File.read("test/fixtures/bp_example.bpmn"), 1),
      }

      response =
        conn
        |> post(business_process_path(conn, :create, attributes))
        |> json_response(201)
      created_business_process = Repo.one(BusinessProcess)

      assert response == as_json_response(created_business_process)
    end
  end

  describe "update/2" do
    test "updates an existing business process and returns it as json", %{conn: conn} do
      business_process = insert(:business_process, name: "old_name")

      response =
        conn
        |> put(business_process_path(
             conn, :update, business_process.id, %{name: "new_name"})
           )
        |> json_response(200)

      assert response["id"] == business_process.id
      assert response["name"] == "new_name"
    end

    test "returns an error if the business process can't be found", %{conn: conn} do
      response =
        conn
        |> put(business_process_path(conn, :update, 123, %{name: "new_name"}))
        |> json_response(404)

      assert response == %{"errors" => ["Business Process not found"]}
    end
  end

  describe "delete/2" do
    test "deletes an existing business process and returns no content", %{conn: conn} do
      id = insert(:business_process).id

      response =
        conn
        |> delete(business_process_path(conn, :delete, id))
        |> json_response(204)

      assert Repo.get(BusinessProcess, id) == nil
      assert response == ""
    end

    test "returns an error if the business process can't be found", %{conn: conn} do
      response =
        conn
        |> delete(business_process_path(conn, :delete, 123, %{name: "new_name"}))
        |> json_response(404)

      assert response == %{"errors" => ["Business Process not found"]}
    end
  end

  def as_json_response(business_process) do
    %{
      "id" => business_process.id,
      "name" => business_process.name,
      "description" => business_process.description,
      "public" => business_process.public,
      "tags" => business_process.tags,
      "status" => business_process.status,
      "inserted_at" => NaiveDateTime.to_iso8601(business_process.inserted_at),
      "updated_at" => NaiveDateTime.to_iso8601(business_process.updated_at),
      "content" => elem(File.read("test/fixtures/bp_example.bpmn"), 1),
    }
  end
end
