defmodule Togglex.Api.WorkspacesTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  import Togglex.Api.Workspaces

  doctest Togglex.Api.Workspaces

  @client Togglex.Client.new(%{access_token: "YOUR_TOKEN_GOES_HERE"}, :api)

  setup_all do
    HTTPoison.start
  end

  test "list/1" do
    use_cassette "workspaces#list" do
      response = list(@client)
      [%{admin: admin_flag, name: name_value}] = response

      assert length(response) == 1
      assert admin_flag == true
      assert name_value == "Diacode"
    end
  end
end
