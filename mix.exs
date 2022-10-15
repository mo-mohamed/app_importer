defmodule AppImporter.MixProject do
  use Mix.Project

  def project do
    [
      app: :app_importer,
      version: "0.1.0",
      elixir: "~> 1.13",
      escript: escript_config(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript_config do
    [main_module: AppImporter.CommandLine]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jaxon, "~> 2.0"},
      {:yaml_elixir, "~> 2.9.0"},
      {:con_cache, "~> 0.13"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
