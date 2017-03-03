# NUMBERS - two types of numbers. Arbitrary sized integers and floating points numbers.

# use underscore to separate groups of three digits when writing large numbers.hundred million like this: 100_000_000

# Octal: 0o444
# Hexdecimal: 0xabc
# Binary: 0b1011
# Floats: 1.0, 0.3141589e1, and 314159.0-e.
# Floats in Elixir are 64 bit double precision.

5 * 5

i 22 * 7

10 / 5

div(10,5)

rem(10,5)

#hexadecimal
# 0xFF returns 255
0xFF

# 0xFF + 0x02 returns 257
0xFF + 0x02

#binary
# 0b1111 returns 15
0b1111

# floating point with exponential syntax
# 2.0e2 returns 200.0
2.0e2
# 2.0e-3 returns 0.002
2.0e-3

#large numbers
# 1000000000 is too confusing to count the zeros
1000000000
# 1_000_000_000 is still 1 billion
1_000_000_000

# in c# upperlimit for a number is 2.1 billion
# i quintillion - 1 with 18 zeros only limit is the amount of memory

# You can invoke the round function to get the closest integer to a given float
round(3.58)

# the trunc function to get the integer part of a float.
trunc(3.58)


#RAISE NUMBER TO A POWER
8.0 = :math.pow(2, 3)
