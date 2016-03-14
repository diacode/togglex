defmodule Togglex.Reports do
  import Togglex
  alias Togglex.Client

  @doc """
  The weekly report gives aggregated 7 day durations or earnings grouped by
  users and projects.

  ## Example

    Togglex.Reports.weekly(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/weekly.md
  """
  @spec weekly(Client.t, [{atom, binary}] | []) :: Togglex.response
  def weekly(client, params \\ []) do
    get("weekly", client, params)
  end

  @doc """
  The detailed report returns the time entries for the requested
  parameters/filters.

  ## Example

    Togglex.Reports.detailed(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/detailed.md
  """
  @spec detailed(Client.t, [{atom, binary}] | []) :: Togglex.response
  def detailed(client, params \\ []) do
    get("details", client, params)
  end

  @doc """
  Summary report returns the aggregated time entries data.

  ## Example

    Togglex.Reports.summary(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/summary.md
  """
  @spec summary(Client.t, [{atom, binary}] | []) :: Togglex.response
  def summary(client, params \\ []) do
    get("summary", client, params)
  end

  @doc """
  Project dashboard returns at-a glance information for a single project. This
  feature is only available with Toggl pro.

  ## Example

    Togglex.Reports.detailed(client, %{"workspace_id" => "111111", "project_id" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/project.md
  """
  @spec project(Client.t, [{atom, binary}] | []) :: Togglex.response
  def project(client, params \\ []) do
    get("project", client, params)
  end
end
