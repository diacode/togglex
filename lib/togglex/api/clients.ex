defmodule Togglex.Api.Clients do
  import Togglex
  alias Togglex.Client

  @doc """
  Creates a client in a specific workspace.

  ## Example

    Togglex.Api.Clients.create(client, %{name: "John Doe", wid: "111111"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#create-a-client
  """
  @spec create(Client.t, map) :: Togglex.Response
  def create(http_client, client_data) do
    post("clients", http_client, %{client: client_data})
  end

  @doc """
  Updates an existing client. Workspace id (wid) can't be changed.

  ## Example

    Togglex.Api.Clients.update(client, "111111", %{name: "Jane Doe", notes: "Best customer of all time"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#update-a-client
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.Response
  def update(http_client, client_id, client_data) do
    put("clients/#{client_id}", http_client, %{client: client_data})
  end

  @doc """
  Deletes an existing client.

  ## Example

    Togglex.Api.Clients.delete(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#delete-a-client
  """
  @spec delete(Client.t, integer | binary) :: Togglex.Response
  def delete(http_client, client_id) do
    Togglex.delete("clients/#{client_id}", http_client)
  end

  @doc """
  Get client details.

  ## Example

    Togglex.Api.Clients.client(api_http_client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-client-details
  """
  @spec client(Client.t, integer | binary) :: Togglex.Response
  def client(http_client, client_id) do
    get("clients/#{client_id}", http_client, [])
  end


  @doc """
  Get all the clients visible to the user.

  ## Example

    Togglex.Api.Clients.clients(api_http_client)

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-clients-visible-to-user
  """
  @spec clients(Client.t) :: Togglex.Response
  def clients(http_client) do
    get("clients", http_client, [])
  end

  @doc """
  Get all projects associated to a particular client.

  ## Example

    Togglex.Api.Clients.projects(api_http_client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/clients.md#get-client-projects
  """
  @spec projects(Client.t, integer | binary) :: Togglex.Response
  def projects(http_client, client_id) do
    get("clients/#{client_id}/projects", http_client, [])
  end
end
