defmodule TweetGrafanaImg.MixProject do
  use Mix.Project

  def project do
    [
      app: :tweet_grafana_img,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto, :public_key],
      mod: {TweetGrafanaImg.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:jason, "~> 1.1"},
      {:httpoison, "~> 1.7"},
      {:oauther, "~> 1.1"},
      {:extwitter, "~> 0.12"},
      {:quantum, "~> 3.0"},
      {:timex, "~> 3.5"},
    ]
  end
end
