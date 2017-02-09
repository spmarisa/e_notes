defmodule If.Else do
  def first(list) do

    if(length(list) == 0) do
      nil
    else
      hd(list)
    end

  end


  list = [1, 2, 3]
  unless length(list) == 0 do
    hd(list)
  end

  if length(list) == 0, do: nil, else: hd(list)

# "quote do CODE end", it displays an abstract syntax tree(ast)
  quote do if length(list) == 0, do: nil, else: hd(list) end


#no elseif syntax in elixir

  if day == :Monday do
    "M"
  else
    if day == :Tuesday do
      "T"
    else
      "WoW"
    end
  end

end
