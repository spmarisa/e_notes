# Strings, Char Lists, Graphemes and Codepoints. string functions
# strings in Elixir are UTF-8 compliant.

# To use them you can have an arbitrary number of characters enclosed by " or '.

# You can also have interpolated expressions inside the string as well as escaped characters.

# Be aware that single quoted strings are actually a list of binaries.


#elixir strings are nothing but a sequence of bytes
string = <<104,101,108,108,111>>

dollar = "$"

byte_size(dollar)

String.length(dollar)

String.replace("Hello", "e", "a")

String.duplicate("Oh my ", 3)
# "Oh my Oh my Oh my "

String.split("Hello World", " ")

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



#

#CHAR LISTs
# Internally, Elixir strings are represented with a sequence of bytes rather than an array of characters. Elixir also has a char list type (character list). Elixir strings are enclosed with double quotes, while char lists are enclosed with single quotes.

# What’s the difference? Each value from a char list is the ASCII value from the character. Let’s dig in:

char_list = 'hello'
# 'hello'

[hd|tl] = char_list
# 'hello'

{hd, tl}
# {104, 'ello'}

Enum.reduce(char_list, "", fn char, acc -> acc <> to_string(char) <> "," end)
# "104,101,108,108,111,"

# When programming in Elixir, we usually use Strings, not char lists. The char lists support is mainly included because it is required for some Erlang modules.




# Graphemes and Codepoints
# Codepoints are just simple Unicode characters which are represented by one or more bytes, depending on the UTF-8 encoding. Characters outside of the US ASCII character set will always encode as more than one byte. For example, Latin characters with a tilde or accents (á, ñ, è) are typically encoded as two bytes. Characters from Asian languages are often encoded as three or four bytes. Graphemes consist of multiple codepoints that are rendered as a single character.

# The String module already provides two methods to obtain them, graphemes/1 and codepoints/1.
string = "\u0061\u0301"
# "á"

String.codepoints string
# ["a", "́"]

String.graphemes string
# ["á"]
