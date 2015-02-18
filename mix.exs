defmodule FNV.Mixfile do
  use Mix.Project

  def project do
    [
      app:     :fnv,
      version: "0.1.0",
      elixir:  "~> 1.0",
      deps:    deps
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      { :hexate, "~> 0.5" }
    ]
  end
end
