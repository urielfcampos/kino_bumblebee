defmodule KinoBumblebee.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "Bumblebee integration with Livebook"

  def project do
    [
      app: :kino_bumblebee,
      version: @version,
      description: @description,
      name: "KinoBumblebee",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      mod: {KinoBumblebee.Application, []}
    ]
  end

  defp deps do
    [
      # TODO: add dependency on bumblebee once public
      {:kino, github: "livebook-dev/kino"},
      {:nx, github: "elixir-nx/nx", sparse: "nx"},
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "components",
      source_url: "https://github.com/livebook-dev/kino_bumblebee",
      source_ref: "v#{@version}",
      extras: ["guides/components.livemd"],
      groups_for_modules: [
        Kinos: [
          Kino.VegaLite
        ]
      ]
    ]
  end

  def package do
    [
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/livebook-dev/kino_bumblebee"
      }
    ]
  end
end