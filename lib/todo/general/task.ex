defmodule Todo.General.Task do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: false}

  schema "tasks" do
    field :done, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :done])
    |> validate_required([:title, :done])
  end
end
