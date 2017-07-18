defmodule Dunce do
  use Application

 def start(_type, _args) do
  children = [
    Plug.Adapters.Cowboy.child_spec(:http, Dunce.Router, [], [port: 6969])
  ]

  opts = [strategy: :one_for_one, name: Dunce.Supervisor]
  Supervisor.start_link(children, opts)
    end
end
