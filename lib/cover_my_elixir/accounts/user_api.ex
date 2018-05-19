defmodule CoverMyElixir.Accounts.UserApi do
  def all do
    url = :cover_my_elixir |> Application.get_env(:apis) |> Keyword.get(:jsonplaceholder)

    with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <-
           HTTPoison.get("#{url}/users"),
         {:ok, users} <- Poison.decode(body) do
      {:ok, users}
    else
      error -> {:error, {"Something went wrong", error}}
    end
  end
end
