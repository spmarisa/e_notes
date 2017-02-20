# Lists are simple collections of values, they may include multiple types; lists may include non-unique values:
# for saving a handful of  values
first_list = [1, 2, 3]
second_list = [:ok, 1, "yes", first_list]

# Elixir implements list as linked lists
# in elixir a list can be thought as a head and a tails
# head is the first element and tail the rest of the list
# 2 build in functions for getting head and tail
hd(first_list)
tl(first_list)

# accessing the list length is an O(n) operation. For this reason, it is typically faster to prepend than append
# Concatenation
list = [3.14, :pie, "Apple"]
["π"] ++ list

# Subtraction
# It uses strict comparison to match the values.
["foo", :bar, 42] -- [42, "bar"]


#pipe is used to create lists
third_list = [1 | [2, 3]]

#1 -> head
#[2, 3] -> tail

fourth_list =  [1 | [2 | [3 | []]]]

#in elixir lists are single linked lists - each element has a pointer to next element
# to find nth element elixir has to traverse through to get to the specified element
#i.e, to get 1millionth element is slower compared to 10th item
# adding a element to the list is faster by placing it at the head

[:ok | first_list]

#pattern matching in lists
first_list = [1, 2, 3]
[a, b, c] = first_list

[h|t] = [3.14, :pie, "Apple"]
#h
#t


#this kind of pattern matching is useful if we are looking at processing lists
#helps in recursing over lists
[head | tail] = first_list


#another type is keyword list - combines lists and tuples
#list of two element tuples, where the first element in a tuple is an atom and second element is any type

options = [{:is_active, false}, {:notify_user, true}, {:create_if_not_exists, true}]

options[:notify_user]


#List Concatenation
[1, 2] ++ [3, 4, 1]

#List Subtraction
["foo", :bar, 42] -- [42, "bar"]s
