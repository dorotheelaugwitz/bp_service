defmodule BpServiceWeb.BusinessProcessView do
  use BpServiceWeb, :view

  def render("index.json", %{business_processes: business_processes}) do
    %{
      business_processes: render_many(
        business_processes, BpServiceWeb.BusinessProcessView, "business_process.json"
      )
    }
  end

  def render("show.json", %{business_process: business_process}) do
    render_one(
      business_process, BpServiceWeb.BusinessProcessView, "business_process.json"
    )
  end

  def render("business_process.json", %{business_process: business_process}) do
    %{
      id: business_process.id,
      name: business_process.name,
      description: business_process.description,
      public: business_process.public,
      tags: business_process.tags,
      status: business_process.status,
      inserted_at: NaiveDateTime.to_iso8601(business_process.inserted_at),
      updated_at: NaiveDateTime.to_iso8601(business_process.updated_at),
      content: business_process.content,
    }
  end
end
