defmodule Togglex.Api.Workspaces do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides functions to work with Toggl Workspace resources.
  """

  @doc """
  Returns all the workspaces where the token owner belongs to

  ## Example

    Togglex.Api.Workspaces.list(client)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspaces
  """
  @spec list(Client.t) :: Togglex.response
  def list(client) do
    get("workspaces", client, [])
  end

  @doc """
  Returns the data of a specific workspace where the token owner should belong to

  ## Example

    Togglex.Api.Workspaces.find(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-single-workspace
  """
  @spec find(Client.t, integer | binary) :: Togglex.response
  def find(client, workspace_id) do
    get("workspaces/#{workspace_id}", client, [])
  end

  @doc """
    Updates attributes from a given workspace.

    Workspace data example:

    ```
    %{
      name: "New workspace name",
      default_currency: "EUR",
      default_hourly_rate: 50
    }
    ```

    ## Example

      Togglex.Api.Workspaces.update(client, "111111", workspace_data})

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#update-workspace
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.response
  def update(client, workspace_id, workspace_data) do
    put("workspaces/#{workspace_id}", client, %{workspace: workspace_data})
  end

  @doc """
  Returns all users contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspaces.users(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-users
  """
  @spec users(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.response
  def users(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/users", client, params)
  end

  @doc """
  Returns all clients contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspaces.clients(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-clients
  """
  @spec clients(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.response
  def clients(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/clients", client, params)
  end

  @doc """
  Returns all projects contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspaces.projects(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-projects
  """
  @spec projects(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.response
  def projects(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/projects", client, params)
  end

  @doc """
  Returns all tags contained in a specific workspace.

  ## Example

    Togglex.Api.Workspaces.tags(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-tags
  """
  @spec tags(Client.t, integer | binary) :: Togglex.response
  def tags(client, workspace_id) do
    get("workspaces/#{workspace_id}/tags", client, [])
  end

  @doc """
  Returns all unfinished tasks contained in a specific workspace. Available only
  for pro workspaces To get a successful response, the token owner must be
  workspace admin.

  To filter tasks by their state you can add the additional param:

  active: possible values true/false/both. By default true. If false, only done tasks are returned

  ## Example

    Togglex.Api.Workspaces.tasks(client, 123456, %{"active" => "both"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-tags
  """
  @spec tasks(Client.t, integer | binary, [{atom, binary}]) :: Togglex.response
  def tasks(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/tasks", client, params)
  end
end
