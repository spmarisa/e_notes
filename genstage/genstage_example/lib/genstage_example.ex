defmodule GenstageExample do
  @moduledoc """
  Documentation for GenstageExample.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GenstageExample.hello
      :world

  """
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(GenstageExample.Producer, [0]),
      worker(GenstageExample.ProducerConsumer, []),
      worker(GenstageExample.Consumer, []),
    ]

    opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def hello do
    :world
  end
end
