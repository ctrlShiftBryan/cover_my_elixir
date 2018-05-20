defmodule CoverMyElixir.Tests.Accounts.UserApi do
  use ExUnit.Case
  import Mock

  alias CoverMyElixir.Accounts.UserApi
  alias CoverMyElixir.Stubs.Accounts.UserApi.Users
  alias HTTPoison.Response

  test "can call the api and get back something with " do
    mock_response = {:ok, %{status_code: 200, body: Users.all() |> Poison.encode!()}}

    with_mock HTTPoison, get: fn _url -> mock_response end do
      # make sure we get :ok
      assert {:ok, users} = UserApi.all()

      # check the keys of each item to make sure the are what we expect
      keys = fn list ->
        list |> Enum.map(&(&1 |> Map.keys())) |> List.flatten() |> Enum.uniq()
      end

      assert ["email", "id", "name", "phone", "username"] == users |> keys.()
    end
  end
end
