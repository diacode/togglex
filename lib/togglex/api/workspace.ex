defmodule Togglex.Api.Workspace do
  import Togglex
  alias Togglex.Api.Client

  @doc """
  Returns all the workspaces where the token owner belongs to

  ## Example

    Togglex.Api.Workspace.workspaces(client)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspaces
  """
  @spec workspaces(Client.t) :: Togglex.Response
  def workspaces(client) do
    get("workspaces", client, [])
  end

  @doc """
  Returns the data of a specific workspace where the token owner should belong to

  ## Example

    Togglex.Api.Workspace.workspace(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-single-workspace
  """
  @spec workspace(Client.t, integer | binary) :: Togglex.Response
  def workspace(client, workspace_id) do
    get("workspaces/#{workspace_id}", client, [])
  end

  @doc """
  Returns all users contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspace.users(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-users
  """
  @spec users(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.Response
  def users(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/users", client, params)
  end

  @doc """
  Returns all clients contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspace.clients(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-clients
  """
  @spec clients(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.Response
  def clients(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/clients", client, params)
  end

  @doc """
  Returns all projects contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspace.projects(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-projects
  """
  @spec projects(Client.t, integer | binary, [{atom, binary}] | []) :: Togglex.Response
  def projects(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/projects", client, params)
  end

  @doc """
  Returns all tags contained in a specific workspace.

  ## Example

    Togglex.Api.Workspace.tags(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-tags
  """
  @spec tags(Client.t, integer | binary) :: Togglex.Response
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

    Togglex.Api.Workspace.tasks(client, 123456, %{"active" => "both"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-tags
  """
  @spec tasks(Client.t, integer | binary, [{atom, binary}]) :: Togglex.Response
  def tasks(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/tasks", client, params)
  end
end
