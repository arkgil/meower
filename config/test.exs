use Mix.Config

config :meower, Meower.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :meower, Meower.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "meower_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
