defmodule Guard do
  def what_is(x) when is_number(x) do
    IO.puts "#{x} is a number"
  end

  def what_is(x) when is_list(x) do
    IO.puts "#{inspect(x)} is a list"
  end

  def what_is(x) when is_atom(x) do
    IO.puts "#{x} is an atom"
  end
end








defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

defmodule Factorial do
  def of(0), do: 1
  def of(n) when n > 0 do
    n * of(n-1)
  end
end


#GUARD CLAUSE LIMITATIONS
#You can write only a subset of Elixir expressions in guard clauses


# Comparison operators
# ==, !=, ===, !==, >, <, <=, >=

# Boolean and negation operators
# or, and, not, ! . Note that || and && are not allowed.

# Arithmetic operators
# +, -, *, /

# Join operators
# <> and ++ , as long as the left side is a literal.

# The in operator
# Membership in a collection or range

# Type-check functions
# These built-in Erlang functions return true if their argument is a given type. You can find their documentation online. 2
# is_atom is_binary is_bitstring is_boolean is_exception is_float is_function is_integer is_list is_map is_number is_pid is_port is_record is_reference is_tuple

# Other functions
# These built-in functions return values (not true or false ). Their documenta-tion is online, on the same page as the type-check functions.
# abs(number) bit_size(bitstring) byte_size(bitstring) div(number,number) elem(tuple, n) float(term)
# hd(list) length(list) node() node(pid|ref|port) rem(number,number) round(number) self() tl(list)
# trunc(number) tuple_size(tuple)
