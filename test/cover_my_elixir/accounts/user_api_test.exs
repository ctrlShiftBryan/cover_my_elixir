defmodule CoverMyElixir.Tests.Accounts.UserApi do
  use ExUnit.Case

  setup do
    bypass = Bypass.open(port: 3001)
    {:ok, bypass: bypass}
  end

  alias CoverMyElixir.Accounts.UserApi
  alias CoverMyElixir.Stubs.Accounts.UserApi.Users

  test "can call the api and get back something with ", %{bypass: bypass} do
    Bypass.expect(bypass, fn conn ->
      assert "/users" == conn.request_path
      assert "GET" == conn.method

      Plug.Conn.resp(conn, 200, Users.all() |> Poison.encode!())
    end)

    # make sure we get :ok
    assert {:ok, users} = UserApi.all()

    # check the keys of each item to make sure the are what we expect
    keys = fn list ->
      list |> Enum.map(&(&1 |> Map.keys())) |> List.flatten() |> Enum.uniq()
    end

    assert ["email", "id", "name", "phone", "username"] == users |> keys.()
  end
end
