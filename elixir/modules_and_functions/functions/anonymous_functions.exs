# fn
#   parameter-list -> body
#   parameter-list -> body ...
# end

# function as a value, not a string. We can pass that function value to other functions. We can also invoke it, passing in arguments.

square = fn(x) -> x * x end
4 = square.(2)


first = fn([head|rest]) -> head end
first.([1, 2])


Enum.map([1, 2, 3], square)
Enum.map([1, 2, 3], fn(x) -> x + 2 end)


#& operator
# The & operator converts the expression that follows into a function.
square = &( &1 * &1 )
# &(&1 + &2) will be converted to fn p1, p2 -> p1 + p2 end .
4 = square.(2)


# For this to work, the arguments must be in the correct order:
rnd = &(Float.round(&1, &2))
# &Float.round/2
rnd = &(Float.round(&2, &1))
#Function<12.17052888 in :erl_eval.expr/5>


Enum.map [1,2,3,4], &(&1 + 1)
# [2, 3, 4, 5]
Enum.map [1,2,3,4], &(&1 * &1)
# [1, 4, 9, 16]
Enum.map [1,2,3,4], &(&1 < 3)
# [true, true, false, false]




Enum.map [1,2,3,4], fn x -> x + 2 end
Enum.map [1,2,3,4], &(&1 + 2)

Enum.each [1,2,3,4], fn x -> IO.inspect x end
Enum.each [1,2,3,4], &(IO.inspect &1)








greet = fn -> IO.puts "Hello" end
greet.()
