# Boolean operators - These support any types
# ||, &&, and !

-20 || true
false || 42

42 && true
42 && nil

!42

!false

# There are three additional operators whose first argument must be a boolean (true or false):
# and, or, not
true and 42
# 42 and true -> throws an error

false or true

not false
# not 42 -> throws an error



# Comparison
# ==, !=, ===, !==, <=, >=, < and >.
# For strict comparison of integers and floats use ===:
2 == 2.0
2 === 2.0




# An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting.
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
:hello > 999
{:hello, :world} > [1, 2, 3]



# As a rule of thumb, use and, or and not when you are expecting booleans. If any of the arguments are non-boolean, use &&, || and !.
