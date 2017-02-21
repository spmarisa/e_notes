# metaprogramming is the process of using code to write code.this gives us the ability to extend the language to fit our needs and dynamically change the code. We’ll start by looking at how Elixir is represented under the hood, then how to modify it, and finally we can use this knowledge to extend it.

    # Quote
    # Unquote
    # Macros
    # Debugging
    #     Private Macros
    #     Macro Hygiene
    #     Binding



#QUOTE
# The first step to metaprogramming is understanding how expressions are represented. In Elixir the abstract syntax tree (AST), the internal representation of our code, is composed of tuples. These tuples contain three parts: function name, metadata, and function arguments.

# In order to see these internal structures, Elixir supplies us with the quote/2 function. Using quote/2 we can convert Elixir code into its underlying representation:

quote do: 42
# 42
quote do: "Hello"
# "Hello"
quote do: :world
# :world
quote do: 1 + 2
# {:+, [context: Elixir, import: Kernel], [1, 2]}
quote do: if value, do: "True", else: "False"
# {:if, [context: Elixir, import: Kernel],
 # [{:value, [], Elixir}, [do: "True", else: "False"]]}

# Notice the first three don’t return tuples? There are five literals that return themselves when quoted:

:atom
# :atom
"string"
# "string"
1 # All numbers
# 1
[1, 2] # Lists
# [1, 2]
{"hello", :world} # 2 element tuples
# {"hello", :world}

###############################################################################################################################

# Unquote

# Now that we can retrieve the internal structure of our code, how do we modify it? To inject new code or values we use unquote/1. When we unquote an expression it will be evaluated and injected into the AST. To demonstrate unquote/1 let’s look at some examples:

denominator = 2
# 2
quote do: divide(42, denominator)
# {:divide, [], [42, {:denominator, [], Elixir}]}
quote do: divide(42, unquote(denominator))
# {:divide, [], [42, 2]}

# In the first example our variable denominator is quoted so the resulting AST includes a tuple for accessing the variable. In the unquote/1 example the resulting code includes the value of denominator instead.


##############################################################################################################################
# MACROS

# Once we understand quote/2 and unquote/1 we’re ready to dive into macros. It is important to remember that macros, like all metaprogramming, should be used sparingly.

# In the simplest of terms macros are special functions designed to return a quoted expression that will be inserted into our application code. Imagine the macro being replaced with the quoted expression rather than called like a function. With macros we have everything necessary to extend Elixir and dynamically add code to our applications.

# We begin by defining a macro using defmacro/2 which, like much of Elixir, is itself a macro (let that sink in). As an example we’ll implement unless as a macro. Remember that our macro needs to return a quoted expression:

defmodule OurMacro do
  defmacro unless(expr, do: block) do
    quote do
      if !unquote(expr), do: unquote(block)
    end
  end
end

# Let’s require our module and give our macro a whirl:

require OurMacro
# nil
OurMacro.unless true, do: "Hi"
# nil
OurMacro.unless false, do: "Hi"
# "Hi"

# Because macros replace code in our application, we can control when and what is compiled. An example of this can be found in the Logger module. When logging is disabled no code is injected and the resulting application contains no references or function calls to logging. This is different from other languages where there is still the overhead of a function call even when the implementation is NOP.

# To demonstrate this we’ll make a simple logger that can either be enabled or disabled:

defmodule Logger do
  defmacro log(msg) do
    if Application.get_env(:logger, :enabled) do
      quote do
        IO.puts("Logged message: #{unquote(msg)}")
      end
    end
  end
end

defmodule Example do
  require Logger

  def test do
    Logger.log("This is a log message")
  end
end

# With logging enabled our test function would result in code looking something like this:

def test do
  IO.puts("Logged message: #{"This is a log message"}")
end

# If we disable logging the resulting code would be:

def test do
end


##############################################################################################################################
