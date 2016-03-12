defmodule Togglex.Api.Project do
  import Togglex
  alias Togglex.Api.Client

  def create do
  end

  def update do
  end

  def delete do
  end

  @spec project(Client.t, integer | binary) :: Togglex.Response
  def project(client, project_id) do
    get("projects/#{project_id}", client, [])
  end

  @spec users(Client.t, integer | binary) :: Togglex.Response
  def users(client, project_id) do
    get("projects/#{project_id}/project_users", client, [])
  end

  @spec tasks(Client.t, integer | binary) :: Togglex.Response
  def tasks(client, project_id) do
    get("projects/#{project_id}/tasks", client, [])
  end
end
