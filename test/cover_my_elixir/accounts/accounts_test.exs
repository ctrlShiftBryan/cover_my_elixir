defmodule CoverMyElixir.AccountsTest do
  use CoverMyElixir.DataCase

  alias CoverMyElixir.Accounts

  import Mock
  alias CoverMyElixir.Stubs.Accounts.UserApi.Users
  alias HTTPoison.Response
  @mock_response {:ok, %Response{status_code: 200, body: Users.all() |> Poison.encode!()}}

  describe "users" do
    alias CoverMyElixir.Accounts.User

    @valid_attrs %{age: 42, name: "some name"}
    @update_attrs %{age: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user_fixture()

      with_mock HTTPoison, get: fn _url -> @mock_response end do
        users = [
          %{"name" => "Leanne Graham", "phone" => "1-770-736-8031 x56442"},
          %{"name" => "Ervin Howell", "phone" => "010-692-6593 x09125"},
          %{"name" => "Clementine Bauch", "phone" => "1-463-123-4447"},
          %{"name" => "Patricia Lebsack", "phone" => "493-170-9623 x156"},
          %{"name" => "Chelsey Dietrich", "phone" => "(254)954-1289"},
          %{"name" => "Mrs. Dennis Schulist", "phone" => "1-477-935-8478 x6430"},
          %{"name" => "Kurtis Weissnat", "phone" => "210.067.6132"},
          %{"name" => "Nicholas Runolfsdottir V", "phone" => "586.493.6943 x140"},
          %{"name" => "Glenna Reichert", "phone" => "(775)976-6794 x41206"},
          %{"name" => "Clementina DuBuque", "phone" => "024-648-3804"}
        ]

        assert Accounts.list_users() == {:ok, users}
      end
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.age == 42
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.age == 43
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
