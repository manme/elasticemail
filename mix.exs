defmodule ElasticEmail.Mixfile do
  use Mix.Project

  def project do
    [
      app: :elasticemail,
      version: "0.1.1",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      source_url: "https://github.com/manme/elasticemail",
      description: description(),
      package: package(),
      deps: deps(),
      docs: [readme: "README.md", main: "README"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    A basic Elixir wrapper of the ElasticEmail API.
    """
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [{:httpoison, "~> 0.12"},
     {:poison, "~> 3.1"},
     {:mock, "~> 0.2.0", only: :test},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
     maintainers: ["Mikhail Mandronov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/manme/elasticemail"}]
  end
end
