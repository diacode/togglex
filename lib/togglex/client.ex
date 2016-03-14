defmodule Togglex.Client do
  defstruct auth: nil, endpoint: nil

  @type auth :: %{access_token: binary}
  @type t :: %__MODULE__{auth: auth, endpoint: binary}

  @spec new(auth, atom) :: t
  def new(auth, :api) do
    %__MODULE__{auth: auth, endpoint: "https://toggl.com/api/v8"}
  end
  def new(auth, :reports) do
    %__MODULE__{auth: auth, endpoint: "https://toggl.com/reports/api/v2"}
  end
end
