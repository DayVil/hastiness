defmodule WebSockex.Mixfile do
  use Mix.Project

  def project do
    [
      app: :websockex,
      name: "WebSockex",
      version: "0.4.3",
      elixir: "~> 1.18",
      description: "An Elixir WebSocket client",
      source_url: "https://github.com/Azolo/websockex",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      deps: deps(),
      docs: docs()
    ]
  end

  defp elixirc_paths(:test), do: [~c"lib", ~c"test/support"]
  defp elixirc_paths(_), do: [~c"lib"]

  def application do
    applications = [:logger, :ssl, :crypto]
    [extra_applications: applications, mod: {WebSockex.Application, []}]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.36", only: :dev, runtime: false},
      {:cowboy, "~> 2.12", only: :test},
      {:plug_cowboy, "~> 2.7", only: :test},
      {:plug, "~> 1.16", only: :test}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Justin Baker"],
      links: %{"GitHub" => "https://github.com/Azolo/websockex"}
    }
  end

  defp docs do
    [
      extras: ["README.md"],
      main: "readme"
    ]
  end
end
