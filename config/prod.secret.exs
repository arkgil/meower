use Mix.Config

config :meower, Meower.Endpoint,
  secret_key_base: "Xz5crBfWUcJ0XYUHTAHgMsjJBZ/mQvNX75qHzm5/YKkFYSBMruReFe1gphZQG043"

config :meower, Meower.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "meower_prod",
  hostname: "localhost",
  pool_size: 20
