# Filters

# You can think of filters as a sort of guard for comprehensions. When a filtered value returns false or nil it is excluded from the final list. Let’s loop over a range and only worry about even numbers. We’ll use the is_even/1 function from the Integer module to check if a value is even or not.
import Integer
for x <- 1..10, is_even(x), do: x
# [2, 4, 6, 8, 10]

# Like generators, we can use multiple filters. Let’s expand our range and then filter only for values that are both even and evenly divisible by 3.
import Integer
for x <- 1..100,
  is_even(x),
  rem(x, 3) == 0, do: x
# [6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84, 90, 96]
