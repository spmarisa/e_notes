#in elixir maps are collection of key value pairs types - some similarity to keyword lists, both are collections of items that have key and a value
#with maps the key doesnot have an atom it can be anything
#maps allow only one instance of each key, where as keyword list dont have that constraint
#maps are more efficient than key word lists


#ELIXIR MAP syntax
# empty map
%{}

# map arrow syntax
%{"one" => 1, "two" => 2}

# shorthand when keys are atoms
%{ one: 1, two: 2}



my_map = %{1 => {"banana", "coconut"}, 2 => {"chicken", "fish"}}

# %{} defines an empty map
# key is the id and value is the tuple that contains items

other_map = %{:food => {:eat, "work"}, "sleep" => "tight"}

#we can have a tuple as a key
another_map = %{{:ok, 1} => true, :banana => false}


other_map["sleep"]

#if our key is an atom
other_map.food

#SIZE OF MAP
map_size(%{a: 1})
1 = map_size(%{a: 1})



# Compared to keyword lists, we can already see two differences:

#     Maps allow any value as a key.
#     Maps’ keys do not follow any ordering.


#maps can be used for pattern matching in elixir
#if we want to assign the list of names from our other_map

%{:food => names_list} = other_map

#
# In Elixir maps are the “go-to” key-value store. Unlike keyword lists they allow keys of any type and are un-ordered. You can define a map with the %{} syntax:

map = %{:foo => "bar", "hello" => :world}
map[:foo]

# If a duplicate is added to a map, it will replace the former value:
%{:foo => "bar", :foo => "hello world"}
map.hello


# Another interesting property of maps is that they provide their own syntax for updating and accessing atom keys:
map = %{foo: "bar", hello: "world"}

%{map | foo: "baz"}

map.hello


############################################################################################################################
# maps are very useful with pattern matching. When a map is used in a pattern, it will always match on a subset of the given value:

%{} = %{:a => 1, 2 => :b}
# %{2 => :b, :a => 1}
%{:a => a} = %{:a => 1, 2 => :b}
# %{2 => :b, :a => 1}
a
# 1
%{:c => c} = %{:a => 1, 2 => :b}
# ** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}

# As shown above, a map matches as long as the keys in the pattern exist in the given map. Therefore, an empty map matches all maps.

# Variables can be used when accessing, matching and adding map keys:

n = 1
# 1
map = %{n => :one}
# %{1 => :one}
map[n]
# :one
%{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}
# %{1 => :one, 2 => :two, 3 => :three}


############################################################################################################################
# the map module provides a very similar API to the Keyword module with convenience functions to manipulate maps:

Map.get(%{:a => 1, 2 => :b}, :a)
# 1
Map.put(%{:a => 1, 2 => :b}, :c, 3)
# %{2 => :b, :a => 1, :c => 3}
Map.to_list(%{:a => 1, 2 => :b})
# [{2, :b}, {:a, 1}]

a = %{1 => "a", 2 => "b"}
Map.put(a, 3, "c")

Map.put(%{a: 1}, :b, 2)




%{a: "New Value"} = %{  %{ a: "Old Value" } | a: "New Value" }

# Note that this does not work to add a new key
%{ %{} | new_key: 1}
# Raises (KeyError) key :new_key not found in: %{}

# Map.put/3 will add a key if it does not exist
%{new_key: 1} = Map.put(%{}, :new_key, 1)
# or update the value if it does exit
%{new_key: 2} = Map.put(%{new_key: 1}, :new_key, 2)




#updating a key's value
map = %{:a => 1, 2 => :b}
# %{2 => :b, :a => 1}

%{map | 2 => "two"}
# %{2 => "two", :a => 1}
%{map | :c => 3}
# ** (KeyError) key :c not found in: %{2 => :b, :a => 1}



#Another interesting property of maps is that they provide their own syntax for accessing atom keys:
 map = %{:a => 1, 2 => :b}
 map.a
 map.c



#get a value from nested maps
nested = %{ one: %{ two: 3} }

3 = get_in(nested, [:one, :two])

# Returns nil for missing value
nil = get_in(nested, [:one, :three])




#patternmatching
%{c: value} = %{c: 1}


#default value can be specified in case key doesnot exist
"default" = Map.get(%{c: 1}, :a, "default")


{:ok, value} = Map.fetch(%{c: 1}, :c)
:error       = Map.fetch(%{c: 1}, :a)

1 = Map.fetch!(%{c: 1}, :c)

# Raises a key error
Map.fetch!(%{c: 1}, :a)



#map to keyword list
[one: 1, two: 2] = Map.to_list(%{one: 1, two: 2})


#map to struct
defmodule User do
  defstruct username: nil
end

%User{username: "test" } = struct(User, %{username: "test", password: "secret"})

# struct! raises KeyError if un-matching keys provided
%User{username: "test" } = struct!(User, %{username: "test", password: "secret"})





#PATTERNMATCH ON MAP
%{ b: value, d: value2 } = %{ a: 1, b: 2, d: 3 }

%{ a: value } = %{ a: 1, b: 2, d: 3 }

#throws an error
%{ c: value } = %{ a: 1, b: 2 }
