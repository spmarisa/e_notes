# Generators and filters


# for n <- [1, 2, 3, 4], do: n * n

# In the expression above, n <- [1, 2, 3, 4] is the generator. It is literally generating values to be used in the comprehension. Any enumerable can be passed in the right-hand side of the generator expression:

for n <- 1..4, do: n * n
# [1, 4, 9, 16]

# Generator expressions also support pattern matching on their left-hand side; all non-matching patterns are ignored. Imagine that, instead of a range, we have a keyword list where the key is the atom :good or :bad and we only want to compute the square of the :good values:

values = [good: 1, good: 2, bad: 3, good: 4]
for {:good, n} <- values, do: n * n
# [1, 4, 16]

# Alternatively to pattern matching, filters can be used to select some particular elements. For example, we can select the multiples of 3 and discard all others:

multiple_of_3? = fn(n) -> rem(n, 3) == 0 end
for n <- 0..5, multiple_of_3?.(n), do: n * n
# [0, 9]

# Comprehensions discard all elements for which the filter expression returns false or nil; all other values are selected.

# Comprehensions generally provide a much more concise representation than using the equivalent functions from the Enum and Stream modules. Furthermore, comprehensions also allow multiple generators and filters to be given. Here is an example that receives a list of directories and gets the size of each file in those directories:

dirs = ['/home/mikey', '/home/james']
for dir  <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
  File.stat!(path).size
end

# Multiple generators can also be used to calculate the cartesian product of two lists:

for i <- [:a, :b, :c], j <- [1, 2], do:  {i, j}
# [a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]

# A more advanced example of multiple generators and filters is Pythagorean triples. A Pythagorean triple is a set of positive integers such that a*a + b*b = c*c, let’s write a comprehension in a file named triple.exs:

defmodule Triple do
  def pythagorean(n) when n > 0 do
    for a <- 1..n,
        b <- 1..n,
        c <- 1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
  end
end

# Now on terminal:

iex triple.exs

Triple.pythagorean(5)
# []
Triple.pythagorean(12)
# [{3, 4, 5}, {4, 3, 5}]
Triple.pythagorean(48)
# [{3, 4, 5}, {4, 3, 5}, {5, 12, 13}, {6, 8, 10}, {8, 6, 10}, {8, 15, 17},
 # {9, 12, 15}, {12, 5, 13}, {12, 9, 15}, {12, 16, 20}, {15, 8, 17}, {16, 12, 20}]

# The code above is quite expensive when the range of search is a large number. Additionally, since the tuple {b, a, c} represents the same Pythagorean triple as {a, b, c}, our function yields duplicate triples. We can optimize the comprehension and eliminate the duplicate results by referencing the variables from previous generators in the following ones, for example:

defmodule Triple do
  def pythagorean(n) when n > 0 do
    for a <- 1..n-2,
        b <- a+1..n-1,
        c <- b+1..n,
        a + b + c <= n,
        a*a + b*b == c*c,
        do: {a, b, c}
  end
end

# Finally, keep in mind that variable assignments inside the comprehension, be it in generators, filters or inside the block, are not reflected outside of the comprehension.
