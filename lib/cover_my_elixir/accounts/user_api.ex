defmodule CoverMyElixir.Accounts.UserApi do
  def all(http_client \\ HTTPoison) do
    url = :cover_my_elixir |> Application.get_env(:apis) |> Keyword.get(:jsonplaceholder)

    with {:ok, %{status_code: 200, body: body}} <- http_client.get("#{url}/users"),
         {:ok, users} <- Poison.decode(body) do
      {:ok, users}
    else
      error -> {:error, {"Something went wrong", error}}
    end
  end
end
