square = fn(x) -> x * x end
4 = square.(2)


first = fn([head|rest]) -> head end
first.([1, 2])


Enum.map([1, 2, 3], square)
Enum.map([1, 2, 3], fn(x) -> x + 2 end)



square = &( &1 * &1 )
4 = square.(2)
