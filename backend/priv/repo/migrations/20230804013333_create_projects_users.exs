defmodule Backend.Repo.Migrations.CreateProjectsUsers do
  use Ecto.Migration

  def change do
    create table(:projects_users) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :project_id, references(:projects, on_delete: :delete_all), null: false
    end

    create unique_index(:projects_users, [:user_id, :project_id])
  end
end
