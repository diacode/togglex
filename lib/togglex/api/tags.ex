defmodule Togglex.Api.Tags do
  import Togglex
  alias Togglex.Client

  @moduledoc """
  Provides functions to work with Toggl Tag resources.
  """

  @doc """
  Creates a new tag in a workspace.

  Tag has the following properties:

  - name: The name of the tag (string, required, unique in workspace)
  - wid: workspace ID, where the tag will be used (integer, required)

  ## Example

    Togglex.Api.Tags.create(client, %{name: "tagname", wid: "111111"})

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tags.md#create-tag
  """
  @spec create(Client.t, map) :: Togglex.response
  def create(client, params) do
    post("tags", client, %{tag: params})
  end

  @doc """
  Updates an existing tag. Workspace id (wid) can't be changed.

  ## Example

    Togglex.Api.Tags.update(client, "111111", %{name: "newtagname")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tags.md#update-a-tag
  """
  @spec update(Client.t, integer | binary, map) :: Togglex.response
  def update(client, tag_id, params) do
    put("tags/#{tag_id}", client, %{tag: params})
  end

  @doc """
  Deletes an existing tag

  ## Example

    Togglex.Api.Tags.delete(client, "111111")

  More info at: https://github.com/toggl/toggl_api_docs/blob/master/chapters/tags.md#delete-a-tag
  """
  @spec delete(Client.t, integer | binary) :: Togglex.response
  def delete(client, tag_id) do
    Togglex.delete("tags/#{tag_id}", client)
  end
end
