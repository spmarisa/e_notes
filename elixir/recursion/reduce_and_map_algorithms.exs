defmodule Math do
  def sum_list([head | tail], accumulator \\ 0) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end


defmodule Math do
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

##############################################################################################################################

# Here we have used recursion to traverse a list, doubling each element and returning a new list. The process of taking a list and mapping over it is known as a map algorithm.

# Recursion and tail call optimization are an important part of Elixir and are commonly used to create loops. However, when programming in Elixir you will rarely use recursion as above to manipulate lists.

# The Enum module, which we’re going to see in the next chapter, already provides many conveniences for working with lists. For instance, the examples above could be written as:

Enum.reduce([1, 2, 3], 0, fn(x, acc) -> x + acc end)
# 6
Enum.map([1, 2, 3], fn(x) -> x * 2 end)
# [2, 4, 6]

# Or, using the capture syntax:

Enum.reduce([1, 2, 3], 0, &+/2)
# 6
Enum.map([1, 2, 3], &(&1 * 2))
# [2, 4, 6]

# Let’s take a deeper look at Enumerables and, while we’re at it, their lazy counterpart, Streams.
