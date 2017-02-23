#in elixir maps are collection of key value pairs types - some similarity to keyword lists, both are collections of items that have key and a value
#with maps the key doesnot have an atom it can be anything
#maps allow only one instance of each key, where as keyword list dont have that constraint
#maps are more efficient than key word lists


my_map = %{1 => {"banana", "coconut"}, 2 => {"chicken", "fish"}}

# %{} defines an empty map
# key is the id and value is the tuple that contains items

other_map = %{:food => {:eat, "work"}, "sleep" => "tight"}

#we can have a tuple as a key
another_map = %{{:ok, 1} => true, :banana => false}


other_map["sleep"]

#if our key is an atom
other_map.food



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
