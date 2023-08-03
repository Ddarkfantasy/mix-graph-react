defmodule BackendWeb.SchemaResolver do
  alias Backend.Schema

  def all_links(_root, _args, _info) do
    {:ok, Schema.list_links()}
  end

  def all_users(_root, _args, _info) do
    {:ok, Schema.list_users()}
  end
end
