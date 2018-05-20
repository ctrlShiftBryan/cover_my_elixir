defmodule CoverMyElixir.Tests.Accounts.UserApi do
  use ExUnit.Case
  import Mock

  test "can call the api and get back something with " do
    stub = CoverMyElixir.Stubs.Accounts.UserApi.Users.all() |> Poison.encode!()
    mock_response = {:ok, %HTTPoison.Response{status_code: 200, body: stub}}

    with_mock HTTPoison, get: fn _url -> mock_response end do
      # make sure we get :ok
      assert {:ok, users} = CoverMyElixir.Accounts.UserApi.all()

      # check the keys of each item to make sure the are what we expect
      keys = fn list ->
        list |> Enum.map(&(&1 |> Map.keys())) |> List.flatten() |> Enum.uniq()
      end

      assert ["email", "id", "name", "phone", "username"] == users |> keys.()
    end
  end
end
