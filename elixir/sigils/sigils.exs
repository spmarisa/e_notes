# Strings, char lists, and word lists sigils
# Besides regular expressions, Elixir ships with three other sigils.


#char list
# The ~c sigil is useful for generating char lists that contain single quotes:
~c/2 + 7 = #{2 + 7}/
~C/2 + 7 = #{2 + 7}/


#regular expressions
re = ~r/elixir/
"Elixir" =~ re
"elixir" =~ re


#because Elixir supports Perl Compatible Regular Expressions (PCRE), we can append i to the end of our sigil to turn off case sensitivity.
re = ~r/elixir/i
"Elixir" =~ re
"elixir" =~ re

#Further, Elixir provides the Regex API which is built on top of Erlang’s regular expression library. Let’s implement Regex.split/2 using a regex sigil:
string = "100_000_000"
Regex.split(~r/_/, string)
#As we can see, the string "100_000_000" is split on the underscore thanks to our ~r/_/ sigil. The Regex.split function returns a list.


#String
# The ~s sigil is used to generate strings, like double quotes are. The ~s sigil is useful when a string contains double quotes:

 ~s/the cat in the hat on the mat/
 ~S/the cat in the hat on the mat/

 ~s/welcome to elixir #{String.downcase "school"}/
  "welcome to elixir school"

 ~S/welcome to elixir #{String.downcase "school"}/
  "welcome to elixir \#{String.downcase \"school\"}"


#Word List
~w/i love elixir school/
  ["i", "love", "elixir", "school"]

~W/i love elixir school/
  ["i", "love", "elixir", "school"]

~w/i love #{'e'}lixir school/
  ["i", "love", "elixir", "school"]

~W/i love #{'e'}lixir school/
  ["i", "love", "\#{'e'}lixir", "school"]

# NaiveDateTime
# A NaiveDateTime can be useful for quickly creating a struct to represent a DateTime without a timezone.

NaiveDateTime.from_iso8601("2015-01-23 23:50:07") == {:ok, ~N[2015-01-23 23:50:07]}


#CREATING SIGILS
# One of the goals of Elixir is to be an extendable programming language. It should come as no surprise then that you can easily create your own custom sigils. In this example, we will create a sigil to convert a string to uppercase. As there is already a function for this in the Elixir Core (String.upcase/1), we will wrap our sigil around that function.

defmodule MySigils do
   def sigil_U(string, []), do: String.upcase(string)
end

import MySigils

~U/elixir school/







# The following escape codes can be used in strings and char lists:
    
    # \\ – single backslash
    # \a – bell/alert
    # \b – backspace
    # \d - delete
    # \e - escape
    # \f - form feed
    # \n – newline
    # \r – carriage return
    # \s – space
    # \t – tab
    # \v – vertical tab
    # \0 - null byte
    # \xDD - represents a single byte in hexadecimal (such as \x13)
    # \uDDDD and \u{D...} - represents a Unicode codepoint in hexadecimal (such as \u{1F600})
