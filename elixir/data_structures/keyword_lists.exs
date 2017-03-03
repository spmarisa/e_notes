# Keywords and maps are the associative collections of Elixir. In Elixir, a keyword list is a special list of tuples whose first element is an atom; they share performance with lists:


# In many functional programming languages, it is common to use a list of 2-item tuples as the representation of a key-value data structure.

# In Elixir, when we have a list of tuples and the first item of the tuple (i.e. the key) is an atom, we call it a keyword list:


list = [foo: "bar", hello: "world", hello: "banana"]

list = [{:foo, "bar"}, {:hello, "world"}]

[{:one, 1}, {:two, 2}] = [one: 1, two: 2]


list[:foo]

Keyword.get(list, :foo)


#default values can also be passed
Keyword.get([a: 1, b: 2, a: 3], :c, "missing")


#to return a list of matching pairs
Keyword.take([a: 1, b: 2, a: 3], [:a])

# The three characteristics of keyword lists highlight their importance:
#    Keys must be atoms.
#    Keys are ordered, as specified by the developer
#    Keys are not unique.
# For these reasons keyword lists are most commonly used to pass options to functions.


# Since keyword lists are lists, we can use all operations available to lists. For example, we can use ++ to add new values to a keyword list:

list ++ [c: 3]

[a: 0] ++ list

new_list = [a: 0] ++ list

new_list[:a]


##############################################################################################################################

# For example, the Ecto library makes use of these features to provide an elegant DSL for writing database queries:

query = from w in Weather,
      where: w.prcp > 0,
      where: w.temp < 20,
     select: w

# These characteristics are what prompted keyword lists to be the default mechanism for passing options to functions in Elixir

#the if/2 macro, we mentioned the following syntax is supported:

if false, do: :this, else: :that

if(false, [do: :this, else: :that])

if(false, [{:do, :this}, {:else, :that}])

##############################################################################################################################

# In general, when the keyword list is the last argument of a function, the square brackets are optional.

# Although we can pattern match on keyword lists, it is rarely done in practice since pattern matching on lists requires the number of items and their order to match:

[a: a] = [a: 1]
# [a: 1]
a
# 1
[a: a] = [a: 1, b: 2]
# ** (MatchError) no match of right hand side value: [a: 1, b: 2]
[b: b, a: a] = [a: 1, b: 2]
# ** (MatchError) no match of right hand side value: [a: 1, b: 2]




#keyword list to map
Enum.into( [a: 1, b: 2, c: 3], %{} )
%{a: 1, b: 2, c: 3} = Enum.into( [a: 1, b: 2, c: 3], %{} )
