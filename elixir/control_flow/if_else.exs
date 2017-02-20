# generally reading a file would return {:ok, content} or {:error, reason}
# what should we do when a file is read or not read

# if | unless | cond | case | with

# Iterating over data
# in the end we will use map and reduce
# elixir doesnt have a "for" or "while" loop
# elixir accomplishes this functionality with recursion
#
# EDGE CASE
# how to handle an empty list

# It should be noted that in Elixir, the only falsey values are nil and the boolean false.


list = []

if(length(list) == 0) do
  nil
else
  hd(list)
end


list = [1, 2, 3]
unless length(list) == 0 do
  hd(list)
end

if length(list) == 0, do: nil, else: hd(list)

# "quote do CODE end", it displays an abstract syntax tree(ast)
  quote do if length(list) == 0, do: nil, else: hd(list) end


#no elseif syntax in elixir
day = "Monday"
if day == :Monday do
  "M"
else
  if day == :Tuesday do
    "T"
  else
    "WoW"
  end
end
