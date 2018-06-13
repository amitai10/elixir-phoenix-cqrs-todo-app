defmodule Todo.General.Aggregates.Task do
  defstruct [
    :uuid,
    :title,
    :done,
  ]

  alias Todo.General.Aggregates.Task
  alias Todo.General.Commands.{
    AddTask
  }

  alias Todo.General.Events.{
    TaskAdded
  }

  @doc """
  Register a new user
  """
  def execute(%Task{uuid: nil}, %AddTask{} = added_task) do
    %TaskAdded{
      task_uuid: added_task.task_uuid,
      title: added_task.title,
    }
  end

  # state mutators

  def apply(%Task{} = task, %TaskAdded{} = added_task) do
    %Task{task |
      uuid: added_task.task_uuid,
      title: added_task.title,
    }
  end
end