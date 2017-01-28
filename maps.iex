#in elixir maps are collection of key value pairs types - some similarity to keyword lists, both are collections of items that have key aand a value
#with maps the key doesnot have an atom it can be anything
#maps allow only one instance of each key, where as keyword list dont have that constraint
#maps are more efficient than key word lists


my_map = %{1 => {"banana", "coconut"}, 2 => {"chicken", "fish"}}

# %{} defines and empty map
# key is the id and value is the tuple that contains items

other_map = %{:food => {:eat, "work"}, "sleep" => "tight"}

#we can have a tuple as a key
another_map = %{{:ok, 1} => true, :banana => false}


other_map["sleep"]

#if our key is an atom
other_map.food

#maps can be used for pattern matching in elixir
#if we want to assign the list of names from our other_map

%{:food => names_list} = other_map
