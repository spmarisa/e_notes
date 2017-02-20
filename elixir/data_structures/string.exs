# strings in Elixir are UTF-8 compliant.
#
# To use them you can have an arbitrary number of characters enclosed by " or '.
#
# You can also have interpolated expressions inside the string as well as escaped characters.
#
# Be aware that single quoted strings are actually a list of binaries.

dollar = "$"

byte_size(dollar)

String.length(dollar)

# combine two string using concatinate
hello = "Hello, "
name = "vasu"
hello <> name

#string interpolation
handle = "spmarisa"
"my twitter handle is @#{handle}. feel free to ping"


#list of number
#in elixir strings are group of ascii numbers or binaries
#binaries are a sequence of bytes defined with the << >>
numbers = [1, 2, 3]
"Test #{numbers}"

#to get binary value of others
euro = "€"
byte_size(euro)
euro <> <<0>>

byte_size(dollar)
dollar <> <<0>>
