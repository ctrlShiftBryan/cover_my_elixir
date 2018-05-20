defmodule CoverMyElixirWeb.PageControllerTest do
  use CoverMyElixirWeb.ConnCase

  import Mock
  alias CoverMyElixir.Stubs.Accounts.UserApi.Users
  alias HTTPoison.Response
  @mock_response {:ok, %Response{status_code: 200, body: Users.all() |> Poison.encode!()}}

  test "GET /", %{conn: conn} do
    with_mock HTTPoison, get: fn _url -> @mock_response end do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    end
  end
end
