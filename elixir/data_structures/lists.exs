# Lists are simple collections of values, they may include multiple types; lists may include non-unique values:
# for saving a handful of  values
first_list = [1, 2, 3]
#values can be of anyty
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
["foo", :bar, 42] -- [42, "bar"]

#list length
length([1, 2, 3])

#list flatten
List.flatten([[[1], 2], [[[3]]]])

#replace at
list = [ 1, 2, 3 ]
List.replace_at(list, 2, "buckle my shoe")


#accessing tuples with list
kw = [{:name, "Dave"}, {:likes, "Programming"}, {:where, "Dallas", "TX"}]
List.keyfind(kw, "Dallas", 1)

#get the last item in the list
List.last([:a, :b, :c])
:c = List.last([:a, :b, :c])


options = [ {:width, 72}, {:style, "light"}, {:style, "print"} ]
Keyword.get_values options, :style



#FILTER LIST
Enum.filter( [1, 2, 3, 4], fn(x) -> x > 2 end )

[3, 4] = Enum.filter( [1, 2, 3, 4], fn(x) -> x > 2 end )




#LIST COMPREHENSIONS
for n <- [1, 2, 3], do: n + n
[2, 4, 6] = for n <- [1, 2, 3], do: n + n




defmodule Su do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end




defmodule MyList do
  def mapsum([], b), do: 0
  def mapsum([head | tail], b), do: b.(head) + mapsum(tail, b)
end

MyList.mapsum [1, 2, 3], &(&1 * &1)




defmodule MyList do
  def maxi(a, b \\ 0)

  def maxi([], b), do: b

  def maxi([head | tail], b) when head > b do
    maxi(tail, head)
  end

  def maxi([head | tail], b) when head < b do
    maxi(tail, b)
  end
end

MyList.maxi([1, 2, 3])
