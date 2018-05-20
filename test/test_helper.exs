ExUnit.start()
Application.ensure_all_started(:bypass)
ExUnit.start(timeout: 600_000)
Ecto.Adapters.SQL.Sandbox.mode(CoverMyElixir.Repo, :manual)
