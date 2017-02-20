# ATOMS - constants that represent names.immutable values
# You write an atom with a leading colon : and a sequence of letters, digits, underscores, and at signs @.
# You can also write them with a leading colon : and an arbitrary sequence of characters enclosed by quotes.
#
# Atoms are a very powerful tool, they are used to reference erlang functions as well as keys and Elixir methods.
# Here are a few valid atoms.
#
# :name, :first_name, :"last name",  :===, :is_it_@_question?
#
#
# BOOLEANS - booleans are true and false values. But the nice thing about them is at the end of the day, they’re just atoms.

:banana

i :banana

#atom with white space
:"this is also an atom"

IO.puts(:"this is an atom")

#:ok atom , common atom in elixir
:ok

#no booleans in elixir
:true
:false

we can eliminate ":"
true
false

i true
i :true

true == :true

#same goes for nil
# it should return the first item that is true nil is also considered as false
nil || false || :firstname || true


# Atoms are also used to reference modules from Erlang libraries, including built in ones.
:crypto.rand_bytes 3
