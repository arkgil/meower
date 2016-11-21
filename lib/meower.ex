defmodule Meower do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Meower.Repo, []),
      supervisor(Meower.Endpoint, []),
      worker(Meower.CatBot, [])
    ]

    opts = [strategy: :one_for_one, name: Meower.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Meower.Endpoint.config_change(changed, removed)
    :ok
  end
end
