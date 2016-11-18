use Mix.Config

config :meower, Meower.Endpoint,
  http: [port: 8080],
  url: [host: "localhost", port: 8080],
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  root: '.',
  version: Mix.Project.config[:version]


config :logger, level: :info

import_config "prod.secret.exs"
