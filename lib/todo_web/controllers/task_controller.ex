defmodule TodoWeb.TaskController do
  use TodoWeb, :controller

  alias Todo.General
  alias Todo.General.Task

  action_fallback TodoWeb.FallbackController

  def index(conn, _params) do
    tasks = General.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    General.create_task(task_params) 
    conn
    |> put_status(:created)
    |> json %{result: "ok"}

    # with {:ok, %Task{} = task} <- General.create_task(task_params) do
    #   conn
    #   |> put_status(:created)
    #   |> put_resp_header("location", task_path(conn, :show, task))
    #   |> render("show.json", task: task)
    # end
  end

  def show(conn, %{"id" => id}) do
    task = General.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = General.get_task!(id)

    with {:ok, %Task{} = task} <- General.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = General.get_task!(id)
    with {:ok, %Task{}} <- General.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
