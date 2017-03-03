# A Protocol is a way to dispatch to a particular implementation of a function based on the type of the parameter.

# The macros defprotocol and defimpl are used to define Protocols and Protocol implementations for different types in the following example.

defprotocol Double do
  def double(input)
end

defimpl Double, for: Integer do
  def double(int) do
    int * 2
  end
end


defimpl Double, for: List do
  def double(list) do
    hd(list) * 3
  end
end



Double.double(2)
#4

Double.double([1, 2])
#[1, 2, 1, 2]
