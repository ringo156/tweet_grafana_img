defmodule TweetGrafanaImg.Application do
  use Application

  def start(_type, _args) do

    import Supervisor.Spec, warn: false
    children = [
      TweetGrafanaImg.Scheduler
    ]
    opts = [strategy: :one_for_one, name: TweetGrafanaImg.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
