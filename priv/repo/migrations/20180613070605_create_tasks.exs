defmodule Todo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :uuid, :uuid, primary_key: true
      add :title, :string
      add :done, :boolean, default: false, null: false

      timestamps()
    end

  end
end
