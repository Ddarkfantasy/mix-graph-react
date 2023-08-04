defmodule BackendWeb.SchemaResolver do
  alias Backend.Schema

  def all_links(_root, _args, _info) do
    {:ok, Schema.list_links()}
  end

  def all_users(_root, _args, _info) do
    {:ok, Schema.list_users()}
  end

  alias Backend.Repo
  # alias Backend.Schema.User
  # alias Backend.Project

  def project_users(parent, _args, _resolution) do
    parent
    |> Repo.preload(:users)
    |> Map.get(:users)
    |> then(&{:ok, &1})
  end

  def user_projects(parent, _args, _resolution) do
    parent
    |> Repo.preload(:projects)
    |> Map.get(:projects)
    |> then(&{:ok, &1})
  end
end
