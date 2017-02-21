# Best Practice
# Adding documentation should be added within the Best practices guidelines of the language. Since Elixir is a fairly young language many standards are still to be discovered as the ecosystem grows. The community, however, tried to establish best practices. To read more about best practices see The Elixir Style Guide.

# Always document a module.
defmodule Greeter do
  @moduledoc """
  This is good documentation.
  """
end

# If you do not intend to document a module, do not leave it blank. Consider annotating the module false, like so:
defmodule Greeter do
  @moduledoc false

end

# When referring to functions within module documentation, use backticks like so:
defmodule Greeter do
  @moduledoc """
  ...

  This module also has a `hello/1` function.
  """
  def hello(name) do
    IO.puts "Hello, " <> name
  end
end


# Separate any and all code one line under the @moduledoc as so:
defmodule Greeter do
  @moduledoc """
  ...

  This module also has a `hello/1` function.
  """

  alias Goodbye.bye_bye
  # and so on...

  def hello(name) do
    IO.puts "Hello, " <> name
  end
end

# Use markdown within functions that will make it easier to read either via IEx or ExDoc.
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

# Try to include some code examples in your documentation. This also allows you to generate automatic tests from the code examples found in a module, function, or macro with ExUnit.DocTest. In order to do that, you need to invoke the doctest/1 macro from your test case and write your examples according to some guidelines as detailed in the official documentation.
