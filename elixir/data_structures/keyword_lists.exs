# Keywords and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of tuples whose first element is an atom; they share performance with lists:
[foo: "bar", hello: "world"]

[{:foo, "bar"}, {:hello, "world"}]

# The three characteristics of keyword lists highlight their importance:
#
#     Keys are atoms.
#     Keys are ordered.
#     Keys are not unique.
#
# For these reasons keyword lists are most commonly used to pass options to functions.
