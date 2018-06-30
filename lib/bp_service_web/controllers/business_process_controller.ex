defmodule BpServiceWeb.BusinessProcessController do
  use BpServiceWeb, :controller

  alias BpService.Repo
  alias BpService.BusinessProcess

  def index(conn, _params) do
    business_processes = Repo.all(BusinessProcess)
    conn
      |> put_status(:ok)
      |> render("index.json", business_processes: business_processes)
  end

  def show(conn, params) do
    business_process = Repo.get(BusinessProcess, params["id"])
    render conn, "show.json", business_process: business_process
  end

  def create(conn, params) do
    changeset = BusinessProcess.changeset(%BusinessProcess{}, params)
    case Repo.insert(changeset) do
      {:ok, inserted} ->
        conn
          |> put_status(:created)
          |> render("show.json", business_process: inserted)
      {:error, _changeset} ->
        conn
          |> put_status(:internal_server_error)
          |> json("Something went wrong")
    end
  end

  def update(conn, params) do
    business_process = Repo.get(BusinessProcess, params["id"])
    if business_process do
      changeset = BusinessProcess.changeset(business_process, params)
      case Repo.update(changeset) do
        {:ok, updated} ->
          conn
            |> put_status(:ok)
            |> render("show.json", business_process: updated)
        {:error, _changeset} ->
          conn
            |> put_status(:internal_server_error)
            |> json("Something went wrong")
      end
    else
      json conn
        |> put_status(:not_found), %{errors: ["Business Process not found"]}
    end
  end

  def delete(conn, params) do
    business_process = Repo.get(BusinessProcess, params["id"])
    if business_process do
      case Repo.delete(business_process) do
        {:ok, _struct} ->
          conn
            |> put_status(:no_content)
            |> json("")
        {:error, _changeset} ->
          conn
            |> put_status(:internal_server_error)
            |> render("Something went wrong")
      end
    else
      json conn
        |> put_status(:not_found), %{errors: ["Business Process not found"]}
    end
  end
end
