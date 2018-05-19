use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cover_my_elixir, CoverMyElixirWeb.Endpoint,
  http: [port: 4001],
  server: false

config :cover_my_elixir, apis: [jsonplaceholder: "http://localhost:3001"]

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :cover_my_elixir, CoverMyElixir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "cover_my_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
