defmodule Togglex.Api.TimeEntry do
  import Togglex
  alias Togglex.Client

  def create do
  end

  def update do
  end

  @doc """
    Bulk update time entries tags

    You can mass assign and remove tags from time entries. Just instead of one
    time_entry_id, you need to send all the time entry ids, which you want to
    update, separated by a comma in the request url. The request is similar to
    regular time entry update.

    You can use the following properties:

    * tags: a list of tag names (array of strings), providing only this atteribute overrides tags on the time entries.
    * tag_action: (string, possible values: add, remove). Merges to or removes from the current time entry tags the values provided by the tags property.

    ## Example

      Togglex.Api.TimeEntry.bulk_update_tags(client, ["111111", "222222"], ["billed"], "add")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#bulk-update-time-entries-tags
  """
  @spec bulk_update_tags(Client.t, [binary], [binary], binary) :: Togglex.Response
  def bulk_update_tags(client, time_entry_ids, tags, tag_action) do
  end

  def delete do
  end

  @doc """
    Get details of a specific time entry.

    ## Example

      Togglex.Api.TimeEntry.time_entry(client, "111111")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-time-entry-details
  """
  @spec time_entry(Client.t, integer | binary) :: Togglex.Response
  def time_entry(client, time_entry_id) do
    get("time_entries/#{time_entry_id}", client)
  end

  @doc """
    Get current running time entry from the user where the token belongs to.

    ## Example

      Togglex.Api.TimeEntry.current(client)

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-running-time-entry
  """
  @spec current(Client.t) :: Togglex.Response
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

      Togglex.TimeEntry.time_entries(client, [start_date: "2016-01-01T12:30:30+00:00", end_date: "2016-03-15T12:30:30+00:00")

    More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/time_entries.md#get-time-entries-started-in-a-specific-time-range
  """
  @spec time_entries(Client.t, [{atom, binary}]) :: Togglex.Reponse
  def time_entries(client, params \\ []) do
    get("time_entries", client, params)
  end

  def start do
  end

  def stop do
  end

end
