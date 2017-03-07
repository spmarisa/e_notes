# Strings, Char Lists, Graphemes and Codepoints. string functions
# Strings in Elixir are inserted between double quotes, and they are encoded in UTF-8:

# To use them you can have an arbitrary number of characters enclosed by " or '.

# You can also have interpolated expressions inside the string as well as escaped characters.

# Be aware that single quoted strings are actually a list of binaries.

string = "hello"
is_binary(string)

# In Elixir, you can get a character’s code point by using ?:
?(
?d
?1

# You can also use the functions in the String module to split a string in its individual characters, each one as a string of length 1:
String.codepoints("hełło")
# ["h", "e", "ł", "ł", "o"]
String.graphemes("Test")
#["T", "e", "s", "t"]



#elixir strings are nothing but a sequence of bytes
string = <<104,101,108,108,111>>

dollar = "$"

byte_size(dollar)

String.length(dollar)

String.replace("Hello", "e", "a")

String.duplicate("Oh my ", 3)
# "Oh my Oh my Oh my "

String.split("Hello World", " ")
["1", "2", "3"] = String.split("1,2,3" , ",")

#parse string to float
{3.14, ""} = Float.parse("3.14")
#parse atring to int
{4, ""} = Integer.parse("4")


String.slice("the cat on the mat", 4, 3)
# "cat"


String.reverse("abc")


# combine two string using concatinate
hello = "Hello, "
name = "vasu"
hello <> name

#string interpolation
handle = "spmarisa"
"my twitter handle is @#{handle}. feel free to ping"

#linebreaks
a = "hello\nworld"
IO.puts(a)


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



###########################################################################################################################


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

is_list 'hełło'

List.first('hello')

to_charlist "hełło"

to_string 'hełło'

to_string :hello

to_string 1
###########################################################################################################################

# Graphemes and Codepoints
# Codepoints are just simple Unicode characters which are represented by one or more bytes, depending on the UTF-8 encoding. Characters outside of the US ASCII character set will always encode as more than one byte. For example, Latin characters with a tilde or accents (á, ñ, è) are typically encoded as two bytes. Characters from Asian languages are often encoded as three or four bytes. Graphemes consist of multiple codepoints that are rendered as a single character.

# The String module already provides two methods to obtain them, graphemes/1 and codepoints/1.
string = "\u0061\u0301"
# "á"

String.codepoints string
# ["a", "́"]

String.graphemes string
# ["á"]

# Strings in Elixir are represented internally by binaries which are sequences of bytes:
is_binary("hellö")


#string functions
String.upcase("hellö")
String.downcase("HELLO")


String.at("Hello", 0)

true = String.ends_with?("Period.", ".")
true  = String.ends_with?("Period.", [".","?"])
false = String.ends_with?("      !", [".","?"])


"hello" = Atom.to_string(:hello)


#join a list of strings
Enum.join(["1","2","3"], ",")


"a" = String.strip("    a     ")


###########################################################################################################################

#Binaries(and bitstrings)
# In Elixir, you can define a binary using <<>>:

<<0, 1, 2, 3>>
# <<0, 1, 2, 3>>
byte_size(<<0, 1, 2, 3>>)
# 4

# A binary is a sequence of bytes. Those bytes can be organized in any way, even in a sequence that does not make them a valid string:
String.valid?(<<239, 191, 191>>)
# false

# The string concatenation operation is actually a binary concatenation operator:
<<0, 1>> <> <<2, 3>>
# <<0, 1, 2, 3>>

# A common trick in Elixir is to concatenate the null byte <<0>> to a string to see its inner binary representation:
"hełło" <> <<0>>
# <<104, 101, 197, 130, 197, 130, 111, 0>>


#Returns a float between 0 and 1 indicating the likely similarity of two strings.
String.jaro_distance("jonathan", "jonathon")

String.jaro_distance("josé", "john")



#to convert one string to another
String.myers_difference("banana", "panama")
