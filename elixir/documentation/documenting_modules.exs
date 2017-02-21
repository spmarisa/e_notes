# Documenting Modules

# The @moduledoc annotator allows for inline documentation at a module level. It typically sits just under the defmodule declaration at the top of a file. The below example shows a one line comment within the @moduledoc decorator.

defmodule Greeter do
  @moduledoc """
  Provides a function `hello/1` to greet a human
  """

  def hello(name) do
    "Hello, " <> name
  end
end

# We (or others) can access this module documentation using the h helper function within IEx.

c("greeter.ex")
# [Greeter]

h Greeter

                # Greeter

# Provides a function hello/1 to greet a human
