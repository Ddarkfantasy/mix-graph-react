defmodule Backend.Repo.Migrations.SetAttributeToNotNull do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :email, :string, null: false
      modify :firstname, :string, null: false
      modify :lastname, :string, null: false
      modify :username, :string, null: false
      modify :age, :integer, null: false
    end

    alter table(:projects) do
      modify :name, :string, null: false
    end
  end
end
