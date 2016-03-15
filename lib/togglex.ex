defmodule Togglex do
  use HTTPoison.Base
  alias Togglex.Client

  @moduledoc """
  Provides multiple functions to make http requests using either of the methods
  GET, POST, PUT or DELETE.
  """

  @user_agent [{"User-agent", "togglex"}]
  @type response :: nil | {integer, any} | Poison.Parser.t

  @spec process_response(HTTPoison.Response.t) :: response
  def process_response(%HTTPoison.Response{status_code: 200, body: ""}), do: nil
  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: Poison.decode!(body, keys: :atoms)
  def process_response(%HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, Poison.decode!(body, keys: :atoms) }

  @spec post(binary, Client.t, binary) :: response
  def post(path, client, body \\ "") do
    _request(:post, url(client, path), client.auth, body)
  end

  @spec put(binary, Client.t, binary) :: response
  def put(path, client, body \\ "") do
    _request(:put, url(client, path), client.auth, body)
  end

  @spec get(binary, Client.t, [{atom, binary}] | []) :: response
  def get(path, client, params \\ []) do
    initial_url = url(client, path)
    url = add_params_to_url(initial_url, Enum.concat(params, [{"user_agent", "togglex"}]))
    _request(:get, url, client.auth)
  end

  def delete(path, client, body \\ "") do
    _request(:delete, url(client, path), client.auth, body)
  end

  def _request(method, url, auth, body \\ "") do
    json_request(method, url, body, authorization_header(auth, @user_agent))
  end

  def json_request(method, url, body \\ "", headers \\ [], options \\ []) do
    request!(method, url, Poison.encode!(body), headers, options) |> process_response
  end

  @spec authorization_header(Client.auth, list) :: list
  def authorization_header(%{access_token: token}, headers) do
    encoded = Base.encode64("#{token}:api_token")
    headers ++ [{"Authorization", "Basic #{encoded}"}]
  end

  @spec url(Client.t, binary) :: binary
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
