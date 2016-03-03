defmodule Togglex do
  use HTTPoison.Base
  alias Togglex.Reports.Client

  @user_agent [{"User-agent", "togglex"}]
  @type response :: nil | {integer, any} | Poison.Parser.t

  @spec process_response(HTTPoison.Response.t) :: response
  def process_response(%HTTPoison.Response{status_code: 200, body: ""}), do: nil
  def process_response(%HTTPoison.Response{status_code: 200, body: body}), do: Poison.decode!(body, keys: :atoms)
  def process_response(%HTTPoison.Response{status_code: status_code, body: ""}), do: { status_code, nil }
  def process_response(%HTTPoison.Response{status_code: status_code, body: body }), do: { status_code, Poison.decode!(body, keys: :atoms) }

  def get(path, client, params \\ []) do
    initial_url = url(client, path)
    url = add_params_to_url(initial_url, params)
    _request(:get, url, client.auth)
  end

  def _request(method, url, auth, body \\ "") do
    request!(method, url, body, authorization_header(auth, @user_agent)) |> process_response
  end

  @spec authorization_header(Client.auth, list) :: list
  def authorization_header(%{access_token: token}, headers) do
    encoded = Base.encode64("#{token}:api_token")
    headers ++ [{"Authorization", "Basic #{encoded}"}]
  end

  @spec url(client :: Client.t, path :: binary) :: binary
  defp url(_client = %Client{endpoint: endpoint}, path) do
    endpoint <> "/" <> path
  end

  defp add_params_to_url(url, params) do
    <<url :: binary, build_qs(params) :: binary>>
  end

  @spec build_qs([{atom, binary}]) :: binary
  defp build_qs([]), do: ""
  defp build_qs(kvs), do: to_string('?' ++ URI.encode_query(kvs))
end
