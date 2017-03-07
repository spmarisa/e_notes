# Once a program grows beyond a couple of lines, you’ll want to structure it. Elixir makes this easy. You break your code into named functions and organize these functions into modules. In fact, in Elixir named functions must be written inside modules.


# In Elixir a named function is identified by both its name and its number of parameters (its arity).

defmodule Times do
  def double(n) do
    n * 2
  end
end


Times.double(4)




# However, do ... end is not actually the underlying syntax. The actual syntax looks like this:
def double(n), do: n * 2

# You can pass multiple lines to do: by grouping them with parentheses.
def greet(greeting, name), do: (
  IO.puts greeting
  IO.puts "How're you doing, #{name}?"
)

# do: syntax for single-line blocks, and do ... end for multiline ones.

defmodule Times do
  def double(n), do: n * 2
end

defmodule Times, do: (def double(n), do: n*2)
