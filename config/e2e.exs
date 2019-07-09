use Mix.Config
# Just like dev but the db is fake
import_config "dev.exs"

config :my_app, sql_sandbox: true
