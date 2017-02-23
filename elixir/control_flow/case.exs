# If it’s necessary to match against multiple patterns we can use case:
case {:ok, "baaaaaa"} do
 {:ok, result} -> result
 {:error} -> "Uh oh!"
 _ -> "Catch all"
end


case {1, 2, 3} do
 {4, 5, 6} -> "This clause won't match"
 {1, x, 3} -> "This clause will match and bind #{x} to 2 in this clause"
 _ -> "This clause would match any value"
end

# The _ variable is an important inclusion in case statements. Without it failure to find a match will raise an error:
case :even do
  :odd -> "Odd"
  _ -> "Not Odd"
end

# Since case relies on pattern matching, all of the same rules and restrictions apply. If you intend to match against existing variables you must use the pin ^ operator:
x = 1
# 1
case 10 do
 ^x -> "Won't match"
 _  -> "Will match"
end
# "Will match"

pie = 3.14
# case 3.14 do
case "cherry pie" do
   ^pie -> "Not so tasty"
   pie -> "I bet #{pie} is tasty"
end
# "I bet cherry pie is tasty"

# Another neat feature of case is its support for guard clauses:
# This example comes directly from the official Elixir Getting Started guide.

case {1, 2, 3} do
  # {1, x, 3} when x == 0 -> "Will match"
  {1, x, 3} when x > 0 -> "Will match"
   _ -> "Won't match"
end
##############################################################################################################################
# Elixir imports and allows the following expressions in guards by default:
# comparison operators (==, !=, ===, !==, >, >=, <, <=)
# boolean operators (and, or, not)
# arithmetic operations (+, -, *, /)
# arithmetic unary operators (+, -)
# the binary concatenation operator <>
# the "in" operator as long as the right side is a range or a list

# all the following type check functions:
    # is_atom/1
    # is_binary/1
    # is_bitstring/1
    # is_boolean/1
    # is_float/1
    # is_function/1
    # is_function/2
    # is_integer/1
    # is_list/1
    # is_map/1
    # is_nil/1
    # is_number/1
    # is_pid/1
    # is_port/1
    # is_reference/1
    # is_tuple/1

# plus these functions:
    #  abs(number)
    #  binary_part(binary, start, length)
    #  bit_size(bitstring)
    #  byte_size(bitstring)
    #  div(integer, integer)
    #  elem(tuple, n)
    #  hd(list)
    #  length(list)
    #  map_size(map)
    #  node()
    #  node(pid | ref | port)
    #  rem(integer, integer)
    #  round(number)
    #  self()
    #  tl(list)
    #  trunc(number)
    #  tuple_size(tuple


# Additionally, users may define their own guards. For example, the Bitwise module defines guards as functions and operators: bnot, ~~~, band, &&&, bor, |||, bxor, ^^^, bsl, <<<, bsr, >>>.

# Note that while boolean operators such as and, or, not are allowed in guards, the more general operators &&, ||, and ! are not.


# If none of the clauses match, an error is raised:

##############################################################################################################################
# Note anonymous functions can also have multiple clauses and guards:
f = fn
 x, y when x > 0 -> x + y
 x, y -> x * y
end

f.(1, 3)
f.(-1, 3)

# The number of arguments in each anonymous function clause needs to be the same, unlike in normal case control flow otherwise an error is raised.

f2 = fn
 x, y when x > 0 -> x + y
 x, y, z -> x * y + z
end
























##############################################################################################################################
def day_abb4(day) do
  case day do
    :Monday -> "M"
    :Tuesday -> "T"
    _ -> "Invalid"
  end
end

def describe_date(date) do
  case date do
    {1, _, _} -> "Brand New Month"
    {25, 12, _} -> "Christmas"
    {25, month, _} -> "only #{12 - month} months till christmas"
    {31, 10, _} -> "Halloween"
    {31, 10, 1517} -> "reformtion"
    {_, month, _} when month <= 12 -> "Just an average month"
    {_, _, _} -> "Invalid month"
  end
end

def send_tweet(path) do
  case File.read(path) do
    {:ok, data} -> Tweet.send(data)
    {:error, error} -> IO.puts "nope"
  end
end

def day_abb2(day) do
  cond do
    day == :Monday -> "M"
    day == :Tuesday -> "T"
    :true -> "Invalid"
  end
end

def day_abb3(:Monday), do: "M"
def day_abb3(:Tuesday), do: "T"
def day_abb3(_), do: "invalid"
