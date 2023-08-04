defmodule Backend.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :name, :string
    many_to_many :users, Backend.Schema.User, join_through: "projects_users"

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
