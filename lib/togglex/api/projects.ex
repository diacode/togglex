defmodule Togglex.Api.Projects do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides functions to work with Toggl Project resources.
  """

  @doc """
  Creates a project in a specific workspace.

  ## Example

    Togglex.Api.Projects.create(client, %{name: "Test project", wid: "111111"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#create-project
  """
  @spec create(Client.t, map) :: Togglex.response
  def create(client, project_data) do
    post("projects", client, %{project: project_data})
  end

  @doc """
  Updates an existing project.

  ## Example

    Togglex.Api.Projects.update(client, "111111", %{name: "Test project 2"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#update-project-data
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.response
  def update(client, project_id, project_data) do
    put("projects/#{project_id}", client, %{project: project_data})
  end

  @doc """
  Deletes an existing project

  ## Example

    Togglex.Api.Projects.delete(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#delete-a-project
  """
  @spec delete(Client.t, integer | binary) :: Togglex.response
  def delete(client, project_id) do
    Togglex.delete("projects/#{project_id}", client)
  end

  @doc """
  Returns the data of an existing project

  ## Example

    Togglex.Api.Projects.find(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#get-project-data
  """
  @spec find(Client.t, integer | binary) :: Togglex.response
  def find(client, project_id) do
    get("projects/#{project_id}", client)
  end

  @doc """
  Returns all ProjectUsers of a Project

  ## Example

    Togglex.Api.Projects.users(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#get-project-users
  """
  @spec users(Client.t, integer | binary) :: Togglex.response
  def users(client, project_id) do
    get("projects/#{project_id}/project_users", client)
  end

  @doc """
  Returns tasks from a Project.

  ## Example

    Togglex.Api.Projects.tasks(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/projects.md#get-project-tasks
  """
  @spec tasks(Client.t, integer | binary) :: Togglex.response
  def tasks(client, project_id) do
    get("projects/#{project_id}/tasks", client)
  end
end
