#ELIXIR BUILDIN TYPES
# •Value types:
#   – Arbitrary-sized integers
#   – Floating-point numbers
#   – Atoms
#   – Ranges
#   – Regular expressions

# • System types:
#   – PIDs and ports
#   – References

# • Collection types:
#   – Tuples
#   – Lists
#   – Maps
#   – Binaries

#functions are also types

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

#Ranges
1..6


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





#available functions in elixir
is_atom(variable)
is_binary(variable)
is_bitstring(variable)
is_boolean(variable)
is_float(variable)
is_function(variable)
is_function(variable, arity)
is_integer(variable)
is_list(variable)
is_map(variable)
is_number(variable)
is_pid(variable)
is_port(variable)
is_reference(variable)
is_tuple(variable)
is_nil(variable)




# system types
# pid's and ports
# A PID is a reference to a local or remote process, and a port is a reference to a resource (typically external to the application) that you’ll be reading or writing.

# The PID of the current process is available by calling self . A new PID is created when you spawn a new process.


# References
# The function make_ref creates a globally unique reference; no other reference will be equal to it. We don’t use references in this book.
