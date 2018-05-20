defmodule CoverMyElixir.Tests.Accounts.UserApi do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup do
    HTTPoison.start()
    ExVCR.Config.cassette_library_dir("fixture/vcr_cassettes")
    :ok
  end

  alias CoverMyElixir.Accounts.UserApi

  test "can call the api and get back something with " do
    use_cassette "httpoison_get" do
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
