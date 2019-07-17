use Mix.Config

# Configure your database
config :rumbl, Rumbl.Repo,
  username: "postgres",
  password: "postgres",
  database: "rumbl_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :rumbl, RumblWeb.Endpoint,
  http: [port: 4002],
  # Will cause problems if running tests twice in for example CI due to ports
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :rumbl, sql_sandbox: true
