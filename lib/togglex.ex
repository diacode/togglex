defmodule Togglex do
  use HTTPoison.Base
  alias Togglex.Api.Client, as: ApiClient
  alias Togglex.Reports.Client, as: ReportsClient

  @user_agent [{"User-agent", "togglex"}]
  @type response :: nil | {integer, any} | Poison.Parser.t

  @spec process_response(HTTPoison.Response.t) :: response
  def process_response(%HTTPoison.Response{status_code: 200, body: ""}), do: nil
  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: Poison.decode!(body, keys: :atoms)
  def process_response(%HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, Poison.decode!(body, keys: :atoms) }

  @spec get(binary, ApiClient.t | ReportsClient.t, [{atom, binary}] | []) :: response
  def get(path, client, params \\ []) do
    initial_url = url(client, path)
    url = add_params_to_url(initial_url, Enum.concat(params, [{"user_agent", "togglex"}]))
    _request(:get, url, client.auth)
  end

  @spec _request(atom, binary, ApiClient.auth | ReportsClient.auth, binary) :: response
  def _request(method, url, auth, body \\ "") do
    request!(method, url, body, authorization_header(auth, @user_agent)) |> process_response
  end

  @spec authorization_header(ApiClient.auth | ReportsClient.auth, list) :: list
  def authorization_header(%{access_token: token}, headers) do
    encoded = Base.encode64("#{token}:api_token")
    headers ++ [{"Authorization", "Basic #{encoded}"}]
  end

  @spec url(ApiClient.t | ReportsClient.t, binary) :: binary
  defp url(%{endpoint: endpoint}, path) do
    endpoint <> "/" <> path
  end

  @spec add_params_to_url(binary, [{atom, binary}]) :: binary
  defp add_params_to_url(url, params) do
    <<url :: binary, build_qs(params) :: binary>>
  end

  @spec build_qs([{atom, binary}]) :: binary
  defp build_qs([]), do: ""
  defp build_qs(kvs), do: to_string('?' ++ URI.encode_query(kvs))
end
