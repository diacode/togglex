defmodule Togglex.Reports.Detailed do
  import Togglex
  alias Togglex.Reports.Client

  def retrieve(client, params \\ []) do
    get("details", client, params)
  end
end
