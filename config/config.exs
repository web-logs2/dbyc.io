# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dbyc,
  ecto_repos: [Dbyc.Repo]

# Configures the endpoint
config :dbyc, DbycWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JwmgXtsR+EgI+WYf54vxg0A//Zfl8odlJIINxVuaThMSvCGRM/s1c6JJA9AqSxsX",
  render_errors: [view: DbycWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dbyc.PubSub,
  live_view: [signing_salt: "+fTYsb74"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
