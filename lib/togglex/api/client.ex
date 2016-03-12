defmodule Togglex.Api.Client do
  defstruct auth: nil, endpoint: "https://toggl.com/api/v8"

  @type auth :: %{access_token: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary}

  @spec new(auth) :: t
  def new(auth) do
    %__MODULE__{auth: auth}
  end
end
