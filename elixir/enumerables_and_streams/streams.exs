# Streams

# As an alternative to Enum, Elixir provides the Stream module which supports lazy operations:

odd? = &(rem(&1, 2) != 0)


1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum

# Streams are lazy, composable enumerables.

# In the example above, 1..100_000 |> Stream.map(&(&1 * 3)) returns a data type, an actual stream, that represents the map computation over the range 1..100_000:

1..100_000 |> Stream.map(&(&1 * 3))


# Furthermore, they are composable because we can pipe many stream operations:

1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?)


# Instead of generating intermediate lists, streams build a series of computations that are invoked only when we pass the underlying stream to the Enum module. Streams are useful when working with large, possibly infinite, collections.



s = Stream.map [1, 3, 5, 7], &(&1 + 1)

Enum.to_list(s)


#here we are not creating intermediatre lists. we are passing successive elements of each of the collection to the next in chain
squares = Stream.map [1, 2, 3, 4], &(&1*&1)
plus_ones = Stream.map squares, &(&1+1)
odds = Stream.filter plus_ones, fn x -> rem(x,2) == 1 end

[1,2,3,4] |> Stream.map(&(&1*&1)) |> Stream.map(&(&1+1)) |> Stream.filter(fn x -> rem(x,2) == 1 end) |> Enum.to_list




#INFINITE Streams
Enum.map(1..10_000_000, &(&1+1)) |> Enum.take(5)

Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5)
