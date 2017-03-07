# List comprehensions are syntactic sugar for looping through enumerables in Elixir. In this lesson we’ll look at how we can use comprehensions for iteration and generation.


# result = for generator or filter... [ , into: value ] , do: expression

# Basics
# Filters
# Using :into
# Generators and filters
# Bitstring Generators


# Often times comprehensions can be used to produce more concise statements for Enum and Stream iteration. Let’s start by looking at a simple comprehension and then break it down:

for n <- [1, 2, 3, 4], do: n * n

list = [1, 2, 3, 4, 5]
for x <- list, do: x*x

for x <- [ 1, 2, 3, 4, 5 ], x < 4, do: x * x

# The first thing we notice is the use of for and a generator. What is a generator? Generators are the x <- [1, 2, 3, 4] expressions found in list comprehensions. They’re responsible for generating the next value.

# Lucky for us, comprehensions aren’t limited to lists; in fact they’ll work with any enumerable:

# Keyword Lists
for {_key, val} <- [one: 1, two: 2, three: 3], do: val
# [1, 2, 3]

# Maps
for {k, v} <- %{"a" => "A", "b" => "B"}, do: {k, v}
# [{"a", "A"}, {"b", "B"}]

# Binaries
for <<c <- "hello">>, do: <<c>>
# ["h", "e", "l", "l", "o"]

# Like many other things in Elixir, generators rely on pattern matching to compare their input set to the left side variable. In the event a match is not found, the value is ignored:

for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: val
# ["Hello", "World"]


# It’s possible to use multiple generators, much like nested loops:
list = [1, 2, 3, 4]
for n <- list, times <- 1..n do
  String.duplicate("*", times)
end
["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"]

# To better illustrate the looping that is occurring, let’s use IO.puts to display the two generated values:
for n <- list, times <- 1..n, do: IO.puts "#{n} - #{times}"
# 1 - 1
# 2 - 1
# 2 - 2
# 3 - 1
# 3 - 2
# 3 - 3
# 4 - 1
# 4 - 2
# 4 - 3
# 4 - 4

# List comprehensions are syntactic sugar and should be used only when appropriate.
