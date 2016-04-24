defmodule FNV.Mixfile do
  use Mix.Project

  @version "0.2.1"
  @project_url "https://github.com/asaaki/ralitobu"
  @docs_url "http://hexdocs.pm/ralitobu"

  def project do
    [
      app: :fnv,
      version: @version,
      elixir: "~> 1.2",
      deps: deps,
      package: package,
      description: description,
      source_url: @project_url,
      homepage_url: @docs_url,
      docs: &docs/0,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application, do: [applications: [:hexate]]

  defp description,
    do: "Pure Elixir implementation of Fowler–Noll–Vo hash functions (FNV-1/FNV-1a)"

  defp package do
    [
      contributors: ["Christoph Grabo"],
      licenses:     ["MIT"],
      links: %{
        "GitHub" => @project_url,
        "Docs" => "#{@docs_url}/#{@version}/"
      },
      files: package_files
    ]
  end

  defp package_files,
    do: ~w(lib mix.exs README.md LICENSE)

  defp docs do
    [
      extras: ["README.md"], main: "readme",
      source_ref: "v#{@version}", source_url: @project_url
    ]
  end

  defp deps do
    [
      {:hexate, "~> 0.5" },

      {:credo, "~> 0.3", only: [:lint, :ci]},
      {:ex_doc, "~> 0.11", only: [:docs, :ci]},
      {:cmark, "~> 0.6", only: [:docs, :ci]},
      {:inch_ex, "~> 0.5", only: [:docs, :ci]},
      {:excoveralls, "~> 0.5", only: [:ci]},
    ]
  end
end
