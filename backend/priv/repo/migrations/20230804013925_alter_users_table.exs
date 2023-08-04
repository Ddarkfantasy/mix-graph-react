defmodule Backend.Repo.Migrations.AlterUsersTable do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove :bio
      remove :number_of_pets
      add :age, :integer
      add :firstname, :string
      add :lastname, :string
      remove :name
      add :username, :string
    end
  end
end
