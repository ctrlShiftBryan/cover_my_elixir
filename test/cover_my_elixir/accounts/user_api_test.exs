defmodule CoverMyElixir.Tests.Accounts.UserApi do
  use ExUnit.Case

  alias CoverMyElixir.Accounts.UserApi
  alias CoverMyElixir.Stubs.Accounts.UserApi.Users

  defmodule MockHttp do
    def get(_url) do
      {:ok, %{status_code: 200, body: Users.all() |> Poison.encode!()}}
    end
  end

  test "can call the api and get back something with " do
    # make sure we get :ok
    assert {:ok, users} = UserApi.all(MockHttp)

    # check the keys of each item to make sure the are what we expect
    keys = fn list ->
      list |> Enum.map(&(&1 |> Map.keys())) |> List.flatten() |> Enum.uniq()
    end

    assert ["email", "id", "name", "phone", "username"] == users |> keys.()
  end
end
