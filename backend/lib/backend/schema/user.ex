defmodule Backend.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :firstname, :string
    field :lastname, :string
    field :username, :string
    field :age, :integer
    many_to_many :projects, Backend.Project, join_through: "projects_users"

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :firstname, :lastname, :username, :age])
    |> validate_required([:email, :firstname, :lastname, :username, :age])
    |> validate_length(:firstname, min: 1, max: 30)
    |> validate_length(:lastname, min: 1, max: 30)
    |> validate_length(:username, min: 1, max: 30)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:age, greater_than: 0)
    |> unique_constraint(:email)
    |> unique_constraint(:username)
  end
end
