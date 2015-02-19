defmodule FNV.Mixfile do
  use Mix.Project

  def project do
    [
      app:           :fnv,
      version:       "0.2.1",
      elixir:        "~> 1.0",
      deps:          deps,
      package:       package,
      description:   "Pure Elixir implementation of Fowler–Noll–Vo hash functions (FNV-1/FNV-1a)",
      name:          "fnv",
      source_url:    "https://github.com/asaaki/fnv.ex",
      homepage_url:  "http://hexdocs.pm/fnv",
      docs:          &docs/0,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application, do: []

  defp package do
    [
      contributors: ["Christoph Grabo"],
      licenses:     ["MIT"],
      links: %{
        "GitHub" => "https://github.com/asaaki/fnv.ex",
        "Issues" => "https://github.com/asaaki/fnv.ex/issues",
        "Docs"   => "http://hexdocs.pm/fnv/"
      },
      files: [
        "lib",
        "LICENSE",
        "Makefile",
        "mix.exs",
        "README.md",
        "src"
      ]
    ]
  end

  defp docs do
    {ref, 0} = System.cmd("git", ["rev-parse", "--verify", "--quiet", "HEAD"])
    [
      source_ref: ref,
      readme:     "README.md",
      main:       "README"
    ]
  end

  defp deps do
    [
      { :hexate,      "~> 0.5" },
      { :excoveralls, "~> 0.3", only: [:dev, :test] },
      { :poison,      "~> 1.3", only: [:dev, :test] },
      { :ex_doc,      "~> 0.7", only: :docs },
      { :earmark,     "~> 0.1", only: :docs },
      { :inch_ex,     "~> 0.2", only: :docs }
    ]
  end
end
