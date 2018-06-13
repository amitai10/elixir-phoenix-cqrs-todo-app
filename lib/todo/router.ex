defmodule Todo.Router do
  use Commanded.Commands.Router

  alias Todo.General.Aggregates.Task
  alias Todo.General.Commands.AddTask

  dispatch [AddTask], to: Task, identity: :task_uuid
end