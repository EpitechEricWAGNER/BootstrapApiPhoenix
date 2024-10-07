defmodule TodolistWeb.TaskController do
  use TodolistWeb, :controller
  alias Todolist.Tasks
  alias Todolist.Tasks.Task

  # GET /api/tasks
  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  # GET /api/tasks/:id
  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)

    case task do
      nil ->
        send_resp(conn, :not_found, "Task not found")
      _ ->
        render(conn, "show.json", task: task)
    end
  end

  # POST /api/tasks
  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Tasks.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, task))
      |> render("show.json", task: task)
    else
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TodolistWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  # DELETE /api/tasks/:id
  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{}} <- Tasks.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end

  # PUT /api/tasks/:id
  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{} = task} <- Tasks.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    else
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(TodolistWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

  # Custom route to get tasks by user ID
  def index_by_user(conn, %{"idUser" => idUser}) do
    tasks = Tasks.get_tasks_by_user(idUser)

    case tasks do
      [] ->
        send_resp(conn, :not_found, "No tasks found for this user")
      _ ->
        render(conn, "index.json", tasks: tasks)
    end
  end
end
