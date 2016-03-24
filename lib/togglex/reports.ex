defmodule Togglex.Reports do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides some functions to get Toggl reports.
  """

  @doc """
  The weekly report gives aggregated 7 day durations or earnings grouped by
  users and projects.

  ## Example

    Togglex.Reports.weekly(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/weekly.md
  """
  @spec weekly(Client.t, [{atom, binary}] | [], atom) :: Togglex.response
  def weekly(client, params \\ [], format \\ :json) do
    get("weekly" <> extension(format), client, params)
  end

  @doc """
  The detailed report returns the time entries for the requested
  parameters/filters.

  ## Example

    Togglex.Reports.detailed(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/detailed.md
  """
  @spec detailed(Client.t, [{atom, binary}] | [], atom) :: Togglex.response
  def detailed(client, params \\ [], format \\ :json) do
    get("details" <> extension(format), client, params)
  end

  @doc """
  Summary report returns the aggregated time entries data.

  ## Example

    Togglex.Reports.summary(client, %{"workspace_id" => "111111", "project_ids" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/summary.md
  """
  @spec summary(Client.t, [{atom, binary}] | [], atom) :: Togglex.response
  def summary(client, params \\ [], format \\ :json) do
    get("summary" <> extension(format), client, params)
  end

  @doc """
  Project dashboard returns at-a glance information for a single project. This
  feature is only available with Toggl pro.

  ## Example

    Togglex.Reports.detailed(client, %{"workspace_id" => "111111", "project_id" => "222222"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/reports/project.md
  """
  @spec project(Client.t, [{atom, binary}] | [], atom) :: Togglex.response
  def project(client, params \\ [], format \\ :json) do
    get("project" <> extension(format), client, params)
  end

  @spec extension(atom) :: binary
  defp extension(format), do: "." <> to_string(format)
end
