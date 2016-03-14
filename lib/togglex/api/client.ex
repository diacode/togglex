defmodule Togglex.Api.Client do
  import Togglex
  alias Togglex.Client

  def create do
  end

  def update do
  end

  def delete do
  end

  @doc """
  Get client details.

  ## Example

    Togglex.Api.Client.client(api_http_client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-client-details
  """
  @spec client(Client.t, integer | binary) :: Togglex.Response
  def client(http_client, client_id) do
    get("clients/#{client_id}", http_client, [])
  end


  @doc """
  Get all the clients visible to the user.

  ## Example

    Togglex.Api.Client.clients(api_http_client)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-clients-visible-to-user
  """
  @spec clients(Client.t) :: Togglex.Response
  def clients(http_client) do
    get("clients", http_client, [])
  end

  @doc """
  Get all projects associated to a particular client.

  ## Example

    Togglex.Api.Client.projects(api_http_client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-client-projects
  """
  @spec projects(Client.t, integer | binary) :: Togglex.Response
  def projects(http_client, client_id) do
    get("clients/#{client_id}/projects", http_client, [])
  end
end
