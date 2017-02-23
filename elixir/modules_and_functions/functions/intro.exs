# Functions are “first class citizens” in Elixir meaning they can be passed as arguments to other functions in the same way as integers and strings.

#############################################################################################################################
# Anonymous Functions
# Anonymous functions can be created inline and are delimited by the keywords fn and end:
# Just as the name implies, an anonymous function has no name. these are frequently passed to other functions. To define an anonymous function in Elixir we need the fn and end keywords. Within these we can define any number of parameters and function bodies separated by ->.

sum = fn(a, b) -> a + b end
sum.(2, 3)

# The & Shorthand
sum = &(&1 + &2)
sum.(2, 3)

# The dot ensures there is no ambiguity between calling an anonymous function named add and a named function add/2

# Anonymous functions are closures and as such they can access variables that are in scope when the function is defined. Let’s define a new anonymous function that uses the add anonymous function we have previously defined:
double = fn a -> sum.(a, a) end
double.(2)

#############################################################################################################################
# Pattern Matching
# Pattern matching isn’t limited to just variables in Elixir, it can be applied to function signatures as we will see in this section.
# Elixir uses pattern matching to identify the first set of parameters which match and invokes the corresponding body:

handle_result = fn
  {:ok, result} -> IO.puts "Handling result..."
  {:error} -> IO.puts "An error has occurred!"
end

some_result = 1
handle_result.({:ok, some_result})

handle_result.({:error})
#############################################################################################################################

# Named Functions
# We can define functions with names so we can easily refer to them later. Named functions are defined within a module using the def keyword . We’ll learn more about Modules in the next lessons, for now we’ll focus on the named functions alone.

# Functions defined within a module are available to other modules for use. This is a particularly useful building block in Elixir:
defmodule Greeter do
  # def hello(name) do
  #   "Hello, " <> name
  # end
  def hello(name), do: "Hello, " <> name
end

Greeter.hello("Sean")

# Armed with our knowledge of pattern matching, let’s explore recursion using named functions:
defmodule Length do
  def of([]), do: 0
  def of([_|t]), do: 1 + of(t)
end

Length.of []


# Function Naming and Arity
# We mentioned earlier that functions are named by the combination of given name and arity (number of arguments). This means you can do things like this:
defmodule Greeter2 do
  def hello(), do: "Hello, anonymous person!"   # hello/0
  def hello(name), do: "Hello, " <> name        # hello/1
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}" # hello/2
end

Greeter2.hello()
Greeter2.hello("Fred")
Greeter2.hello("Fred", "Jane")

#########################################################################################################################

# Private Functions
# When we don’t want other modules accessing a specific function we can make the function private. Private functions can only be called from within their own Module. We define them in Elixir with defp:
defmodule Greeter do
  def hello(name), do: phrase <> name
  defp phrase, do: "Hello, "
end

Greeter.hello("Sean")
Greeter.phrase

#########################################################################################################################

# Guards
# Once Elixir has matched a function any existing guards will be tested.

# In the following example we have two functions with the same signature, we rely on guards to determine which to use based on the argument’s type:

defmodule Greeter do
  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase <> name
  end

  defp phrase, do: "Hello, "
end

Greeter.hello ["Sean", "Steve"]
"Hello, Sean, Steve"

#########################################################################################################################


#########################################################################################################################


# Default Arguments
# If we want a default value for an argument we use the "argument \\ value" syntax:
defmodule Greeter do
  def hello(name, country \\ "en") do
    phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

# When we combine our guard example with default arguments, we run into an issue. Let’s see what that might look like:
defmodule Greeter do
  def hello(names, country \\ "en") when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello(country)
  end

  def hello(name, country \\ "en") when is_binary(name) do
    phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end
# ** (CompileError) def hello/2 has default values and multiple clauses, define a function head with the defaults

# Elixir doesn’t like default arguments in multiple matching functions, it can be confusing. To handle this we add a function head with our default arguments:

defmodule Greeter do
  def hello(names, country \\ "en")
  def hello(names, country) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello(country)
  end

  def hello(name, country) when is_binary(name) do
    phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

Greeter.hello ["Sean", "Steve"]

Greeter.hello ["Sean", "Steve"], "es"
