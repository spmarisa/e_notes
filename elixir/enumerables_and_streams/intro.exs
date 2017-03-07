#Technically, things that can be iterated are said to implement the Enumerable protocol.

# The Enum module is the workhorse for collections
# The Stream module lets you enumerate a collection lazily.This means that the next value is calculated only when it is needed.


#A set of algorithms for enumerating over collections.
# The Enum module includes nearly 100 functions for working with the collections.
Enum.__info__(:functions) |> Enum.each(fn({function, arity}) ->
   IO.puts "#{function}/#{arity}"
end)


# all?
# When using all?, and much of Enum, we supply a function to apply to our collection’s items. In the case of all?, the entire collection must evaluate to true otherwise false will be returned:
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end)


# any?
# Unlike the above, any? will return true if at least one item evaluates to true:
Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)


# chunk
# If you need to break your collection up into smaller groups, chunk is the function you’re probably looking for:
Enum.chunk([1, 2, 3, 4, 5, 6], 2)

# chunk_by
# If we need to group our collection based on something other than size, we can use the chunk_by/2 method. It takes a given enumerable and a function, and when the return on that function changes a new group is started and begins the creation of the next:
Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end)
Enum.chunk_by(["one", "two", "six", "three", "four", "five"], fn(x) -> String.length(x) end)
Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end)



# map_every
# Sometimes chunking out a collection isn’t enough for exactly what we may need. If this is the case, map_every/3 can be very useful to hit only specific items if your collection has an ordering that such is necessary or useful:
Enum.map_every([1, 2, 3, 4], 2, fn x -> x * 2 end)
[2, 2, 6, 4]


# each
# It may be necessary to iterate over a collection without producing a new value, for this case we use each:
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

#map
#To apply our function to each item and produce a new collection look to the map function:
Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
Enum.map([1, 2, 3], fn(i) -> i * 2 end)

Enum.map(%{ one: 1, two: 2}, fn({k, v}) -> k end)
Enum.map([c: 1, d: 2], fn({k, v}) -> v end)
Enum.map([1, 2, 3], fn(i) -> {:a , i * 2} end)

# min
# min/1 finds the min value in the collection:
Enum.min([5, 3, 0, -1])
# min/2 does the same, but allows us to specify a default value to Enum in an anonymous function that is passed:
Enum.min([], fn -> :foo end)


# max
# max/1 returns the max value in the collection:
Enum.max([5, 3, 0, -1])
# max/2 does the same, and behaves as min/2 does as well, allowing us to pass an anonymous function to provide a default value to Enum:
Enum.max([], fn -> :bar end)


# reduce
# With reduce we can distill our collection down into a single value. To do this we supply an optional accumulator (10 in this example) to be passed into our function; if no accumulator is provided the first value is used:
Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end)
6 = Enum.reduce(%{ a: 1, b: 2, c: 3 }, 0, fn({_k, v}, acc) -> v + acc end)



#sort
# Sorting our collections is made easy with not one, but two, sort functions. The first option available to us uses Elixir’s term ordering to determine the sorted order:
Enum.sort([5, 6, 1, 3, -1, 4])
Enum.sort([:foo, "bar", Enum, -1, 4])

# The other option allows us to provide a sort function:
# with our function
Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
# without
Enum.sort([%{:count => 4}, %{:count => 1}])


# uniq_by
# We can use uniq_by/2 to remove duplicates from our collections:
Enum.uniq_by([1, 2, 3, 2, 1, 1, 1, 1, 1], fn x -> x end)


#SUM
Enum.sum([1, 2, 3])
6 == Enum.sum(1..3)
