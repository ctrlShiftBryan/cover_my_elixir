# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cover_my_elixir,
  apis: [jsonplaceholder: "https://jsonplaceholder.typicode.com"],
  ecto_repos: [CoverMyElixir.Repo]

# Configures the endpoint
config :cover_my_elixir, CoverMyElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ql2U8hfEKL/t66AFZ9M+Ep44YEOxRGzOsOAgjPtECWgTQpSAd2ftDALrUYchGc6L",
  render_errors: [view: CoverMyElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoverMyElixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
