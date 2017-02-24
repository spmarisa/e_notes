# Protocols and structs

# The power of Elixir’s extensibility comes when protocols and structs are used together.

# In the previous chapter, we have learned that although structs are maps, they do not share protocol implementations with maps. For example, MapSets (sets based on maps) are implemented as structs. Let’s try to use the Size protocol with a MapSet:

 Size.size(%{})
# 0
 set = %MapSet{} = MapSet.new
#MapSet<[]>
 Size.size(set)
# ** (Protocol.UndefinedError) protocol Size not implemented for #MapSet<[]>

# Instead of sharing protocol implementation with maps, structs require their own protocol implementation. Since a MapSet has its size precomputed and accessible through MapSet.size/1, we can define a Size implementation for it:

defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end

# If desired, you could come up with your own semantics for the size of your struct. Not only that, you could use structs to build more robust data types, like queues, and implement all relevant protocols, such as Enumerable and possibly Size, for this data type.

defmodule User do
  defstruct [:name, :age]
end

defimpl Size, for: User do
  def size(_user), do: 2
end
