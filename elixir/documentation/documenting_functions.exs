# Documenting Functions

# Just as Elixir gives us the ability for module level annotation, it also enables similar annotations for documenting functions. The @doc annotator allows for inline documentation at a function level. The @doc annotator sits just above the function it is annotating.

defmodule Greeter do
  @moduledoc """
  ...
  """

  @doc """
  Prints a hello message

  ## Parameters

    - name: String that represents the name of the person.

  ## Examples

      iex> Greeter.hello("Sean")
      "Hello, Sean"

      iex> Greeter.hello("pete")
      "Hello, pete"

  """
  @spec hello(String.t) :: String.t
  def hello(name) do
    "Hello, " <> name
  end
end

# If we kick into IEx again and use the helper command (h) on the function prepended with the module name, we should see the following:

c("greeter.ex")
# [Greeter]

h Greeter.hello

                # def hello(name)

# Prints a hello message

# Parameters

  # • name: String that represents the name of the person.

# Examples

 Greeter.hello("Sean")
    "Hello, Sean"

 Greeter.hello("pete")
    "Hello, pete"


# Notice how you can use markup within our documentation and the terminal will render it? Apart from really being cool and a novel addition to Elixir’s vast ecosystem, it gets much more interesting when we look at ExDoc to generate HTML documentation on the fly.

# Note: the @spec annotation is used to static analysis of code. To learn more about it, check out the Specifications and types lesson.
