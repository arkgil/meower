use Mix.Config

config :meower,
  ecto_repos: [Meower.Repo]

config :meower, Meower.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KPXEEycTX1Bp3YAld3t0K4qaPUJ1lLc5JooCUSQufYo+0AVP5qcp7tmWwfDZFlPb",
  render_errors: [view: Meower.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Meower.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
