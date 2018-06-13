defmodule Todo.General.Projectors.Task do
  use Commanded.Projections.Ecto, name: "General.Projectors.Task"

  alias Todo.General.Events.TaskAdded
  alias Todo.General.Task

  project %TaskAdded{} = task_added do
    Ecto.Multi.insert(multi, :task, %Task{
      uuid: task_added.task_uuid,
      title: task_added.title,
    })
  end
end