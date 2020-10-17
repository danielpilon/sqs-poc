defmodule SqsPoc.MixProject do
  use Mix.Project

  def project do
    [
      app: :sqs_poc,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :conduit],
      mod: {SqsPoc.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:conduit_sqs, "~> 0.3.0"},
      {:conduit, "~> 0.12"}
    ]
  end
end
