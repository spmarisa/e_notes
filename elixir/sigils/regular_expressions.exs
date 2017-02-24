# we are going to explore sigils, which are one of the mechanisms provided by the language for working with textual representations. Sigils start with the tilde (~) character which is followed by a letter (which identifies the sigil) and then a delimiter; optionally, modifiers can be added after the final delimiter.


# The most common sigil in Elixir is ~r, which is used to create regular expressions:


regex = ~r/foo|bar/

"foo" =~ regex
# true

"bat" =~ regex
#false


# Elixir provides Perl-compatible regular expressions (regexes), as implemented by the PCRE library. Regexes also support modifiers. For example, the i modifier makes a regular expression case insensitive:

"HELLO" =~ ~r/hello/
# false
"HELLO" =~ ~r/hello/i
# true

# So far, all examples have used / to delimit a regular expression. However sigils support 8 different delimiters:

# ~r/hello/
# ~r|hello|
# ~r"hello"
# ~r'hello'
# ~r(hello)
# ~r[hello]
# ~r{hello}
# ~r<hello>
