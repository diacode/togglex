defmodule Togglex.Api.TimeEntries do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides functions to work with Toggl Time Entry resources.
  """

  @doc """
    Creates a time entry.

    Time entry data example:

    ```
    %{
      description: "Mockup",
      pid: "111111",
      start: "2016-01-01T12:30:30+00:00",
      duration: 3600
    }
    ```

    ## Example

      Toggl.Api.TimeEntry.create(client, time_entry_data)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#create-a-time-entry
  """
  @spec create(Client.t, map) :: Togglex.response
  def create(client, time_entry_data) do
    body = %{time_entry: Dict.merge(time_entry_data, created_with: "togglex")}
    post("time_entries", client, body)
  end

  @doc """
    Updates an existing time entry.

    ## Example

      Toggl.Api.TimeEntry.update(client, "111111", time_entry_data)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#update-a-time-entry
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.response
  def update(client, time_entry_id, time_entry_data) do
    put("time_entries/#{time_entry_id}", client, %{time_entry: time_entry_data})
  end

  @doc """
    Bulk update time entries tags.

    You can mass assign and remove tags from time entries. Just instead of one
    time_entry_id, you need to send all the time entry ids, which you want to
    update, separated by a comma in the request url. The request is similar to
    regular time entry update.

    You can use the following properties:

    * tags: a list of tag names (array of strings), providing only this atteribute overrides tags on the time entries.
    * tag_action: (string, possible values: add, remove). Merges to or removes from the current time entry tags the values provided by the tags property.

    ## Example

      Togglex.Api.TimeEntries.bulk_update_tags(client, ["111111", "222222"], ["billed"], "add")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#bulk-update-time-entries-tags
  """
  @spec bulk_update_tags(Client.t, [binary], [binary], binary) :: Togglex.response
  def bulk_update_tags(client, time_entry_ids, tags, tag_action) do
  end

  @doc """
    Deletes an existing time entry.

    ## Example

      Togglex.Api.TimeEntries.delete(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#delete-a-time-entry
  """
  @spec delete(Client.t, integer | binary) :: Togglex.response
  def delete(client, time_entry_id) do
    Togglex.delete("time_entries/#{time_entry_id}", client)
  end

  @doc """
    Get details of a specific time entry.

    ## Example

      Togglex.Api.TimeEntries.find(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-time-entry-details
  """
  @spec find(Client.t, integer | binary) :: Togglex.response
  def find(client, time_entry_id) do
    get("time_entries/#{time_entry_id}", client)
  end

  @doc """
    Get current running time entry from the user where the token belongs to.

    ## Example

      Togglex.Api.TimeEntries.current(client)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-running-time-entry
  """
  @spec current(Client.t) :: Togglex.response
  def current(client) do
    get("time_entries/current", client)
  end

  @doc """
    Get time entries started in a specific time range.

    With start_date and end_date parameters you can specify the date range of
    the time entries returned. If start_date and end_date are not specified,
    time entries started during the last 9 days are returned.

    The limit of returned time entries is 1000. So only the first 1000 found
    time entries are returned. To get all time entries for a specific time span,
    you should consider using the detailed report request, which returns
    paginated results, but enables you to get all the asked time entries with
    multiple requests.

    start_date and end_date must be ISO 8601 date and time strings

    ## Example

      Togglex.TimeEntry.list(client, [start_date: "2016-01-01T12:30:30+00:00", end_date: "2016-03-15T12:30:30+00:00")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-time-entries-started-in-a-specific-time-range
  """
  @spec list(Client.t, [{atom, binary}]) :: Togglex.Reponse
  def list(client, params \\ []) do
    get("time_entries", client, params)
  end

  @doc """
    Start a time entry.

    Time entry data example:

    ```
    %{
      "description" => "Nice description",
      "pid" => "111111",
      "tags" => ["billed"]
    }
    ```

    ## Example

      Togglex.TimeEntry.start(client, time_entry_data)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#stop-a-time-entry
  """
  @spec start(Client.t, list | map) :: Togglex.response
  def start(client, time_entry_data) do
    body = %{time_entry: Dict.merge(time_entry_data, created_with: "togglex")}
    post("time_entries/start", client, body)
  end

  @doc """
    Stop a time entry.

    ## Example

      Togglex.TimeEntry.stop(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#stop-a-time-entry
  """
  @spec stop(Client.t, binary | integer) :: Togglex.response
  def stop(client, time_entry_id) do
    put("time_entries/#{time_entry_id}/stop", client)
  end
end
