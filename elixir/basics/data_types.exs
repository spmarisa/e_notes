# Integers
255
0x1F

# Floats
3.14
1.0e-10

# Booleans
# Booleans true and false are also the atoms :true and :false respectively.
true
false
:true
:false
true |> is_atom
:true |> is_boolean

# Atoms
# Names of modules in Elixir are also atoms. MyApp.MyModule is a valid atom, even if no such module has been declared yet.
:foo
:bar
is_atom(MyApp.MyModule)
MyApp.MyModule |> is_atom

# Strings
"Hello"
a = "foo\nbar"
IO.puts(a)


#Collections
#List, tuples, keywords, maps and functional combinators.

#Lists
[1, 2, 3]

#Tuples
{1, 2, 3}

#Keyword lists
#Maps



#elixir also provides Port, Reference, and PID as data types

# An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting.
# number < atom < reference < function < port < pid < tuple < map < list < bitstring
