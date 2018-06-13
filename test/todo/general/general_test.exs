defmodule Todo.GeneralTest do
  use Todo.DataCase

  alias Todo.General

  describe "tasks" do
    alias Todo.General.Task

    @valid_attrs %{done: true, title: "some title"}
    @update_attrs %{done: false, title: "some updated title"}
    @invalid_attrs %{done: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> General.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert General.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert General.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = General.create_task(@valid_attrs)
      assert task.done == true
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = General.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = General.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.done == false
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = General.update_task(task, @invalid_attrs)
      assert task == General.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = General.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> General.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = General.change_task(task)
    end
  end
end
