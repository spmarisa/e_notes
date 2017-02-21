# Using :into

# What if we want to produce something other than a list? Given the :into option we can do just that! As a general rule of thumb, :into accepts any structure that implements the Collectable protocol.

# Using :into, let’s create a map from a keyword list:

for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: {k, v}
# %{one: 1, three: 3, two: 2}

# Since bitstrings are enumerable we can use list comprehensions and :into to create strings:

for c <- [72, 101, 108, 108, 111], into: "", do: <<c>>
# "Hello"

# That’s it! List comprehensions are an easy way to iterate through collections in a concise manner.
