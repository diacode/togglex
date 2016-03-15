defmodule Togglex.Api.Tasks do
  import Togglex
  alias Togglex.Client

  @doc """
    Creates a new Task.

    Task data example:

    ```
    %{
      name: "Create a Toggle API wrapper in Elixir",
      pid: "111111",
      estimated_seconds: 2700
    }
    ```

    ## Example

      Togglex.Api.Tasks.create(client, task_data)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tasks.md#create-a-task
  """
  @spec create(Client.t, map) :: Togglex.Response
  def create(client, task_data) do
    post("tasks", client, %{task: task_data})
  end

  @doc """
    Updates an existing Task.

    Task data example:

    ```
    %{
      name: "Create a Toggle API wrapper in Elixir with tests",
      estimated_seconds: 7200
    }
    ```

    Workspace id (wid) and project id (pid) can't be changed on update.

    ## Example

      Togglex.Api.Tasks.update(client, "111111", task_data)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tasks.md#update-a-task
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.Response
  def update(client, task_id, task_data) do
    put("tasks/#{task_id}", client, %{task: task_data})
  end

  @doc """
    Returns details of an existing Task given its id.

    ## Example

      Togglex.Api.Tasks.find(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tasks.md#get-task-details
  """
  @spec find(Client.t, integer | binary) :: Togglex.Response
  def find(client, task_id) do
    get("tasks/#{task_id}", client)
  end

  @doc """
    Deletes an existing Task.

    ## Example

      Togglex.Api.Tasks.delete(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tasks.md#delete-a-task
  """
  @spec delete(Client.t, integer | binary) :: Togglex.Response
  def delete(client, task_id) do
    Togglex.delete("tasks/#{task_id}", client)
  end
end
