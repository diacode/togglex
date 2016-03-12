defmodule Togglex.Api.Workspace do
  import Togglex
  alias Togglex.Api.Client

  @doc """
  Returns all projects contained in a specific workspace. To get a successful
  response, the token owner must be workspace admin

  ## Example

    Togglex.Api.Workspace.projects(client, 123456)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/workspaces.md#get-workspace-projects
  """
  @spec projects(Client.t, integer, [{atom, binary}] | []) :: Togglex.Response
  def projects(client, workspace_id, params \\ []) do
    get("workspaces/#{workspace_id}/projects", client, params)
  end
end
