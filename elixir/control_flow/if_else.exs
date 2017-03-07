# generally reading a file would return {:ok, content} or {:error, reason}
# what should we do when a file is read or not read

# if | unless | cond | case | with

# Iterating over data
# in the end we will use map and reduce
# elixir doesnt have a "for" or "while" loop
# elixir accomplishes this functionality with recursion

# EDGE CASE
# how to handle an empty list

# It should be noted that in Elixir, the only falsey values are nil and the boolean false.

# Besides case and cond, Elixir also provides the macros if/2 and unless/2 which are useful when you need to check for only one condition:

if 1 == 1, do: "true part", else: "false part"

list = []

if(length(list) == 0) do
  nil
else
  hd(list)
end



unless 1 == 1, do: "error", else: "OK"

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


# do/end blocks

# At this point, we have learned four control structures: case, cond, if, and unless, and they were all wrapped in do/end blocks. It happens we could also write if as follows:

if true, do: 1 + 2
if false, do: :this, else: :that

if true do
 a = 1 + 2
 a + 10
end

if true, do: (
 a = 1 + 2
 a + 10
)


if false, do: "good", else: "else"
