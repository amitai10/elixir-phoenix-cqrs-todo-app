defmodule Todo.General.Events.TaskAdded do
  @derive [Poison.Encoder]
  defstruct [
    :task_uuid,
    :title,
  ]
end