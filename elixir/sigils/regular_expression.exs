# A regex sigil to match 'foo'
~r/foo/

# Interpolation can be used
~r/foo/ = ~r/#{"foo"}/

# Test if a string matches
true = Regex.match?( ~r/foo/ , "Hello foo")

# Run returns first match
["foo1", "1"] = Regex.run(~r/foo([0-9])/, "foo1 foo2")

# Scan returns all matches
[["foo1", "1"], ["foo2", "2"]] = Regex.scan(~r/foo([0-9])/, "foo1 foo2")

# Replace matches in a string
"one_two_three" = Regex.replace(~r/-/, "one-two-three", "_")


#
# Opt Meaning
# f   Force the pattern to start to match on the first line of a multiline string.
# g   Support named groups.
# i   Make matches case insensitive.
# m   If the string to be matched contains multiple lines, ^ and $ match the start and end of these lines. \A and \z continue to match the beginning or end of the string.
# s   Allow . to match any newline characters.
# U   Normally modifiers like * and + are greedy, matching as much as possible. The U modifier makes them ungreedy, matching as little as possible.
# u   Enable unicode-specific patterns like \p.
# x   Enable extended mode—ignore whitespace and comments ( # to end of line).



#MANIPULATE REGULAR EXPRESSIONS WITH REGEX MODULE
Regex.run ~r{[aeiou]}, "caterpillar"
# ["a"]
Regex.scan ~r{[aeiou]}, "caterpillar"
# [["a"], ["e"], ["i"], ["a"]]
Regex.split ~r{[aeiou]}, "caterpillar"
# ["c", "t", "rp", "ll", "r"]
Regex.replace ~r{[aeiou]}, "caterpillar", "*"
# "c*t*rp*ll*r"
