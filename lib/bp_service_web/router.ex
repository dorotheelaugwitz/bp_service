defmodule BpServiceWeb.Router do
  use BpServiceWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", BpServiceWeb do
    pipe_through :api

    resources "/business_processes", BusinessProcessController, except: [:new, :edit]
  end
end
