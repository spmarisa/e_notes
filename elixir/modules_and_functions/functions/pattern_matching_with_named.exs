defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end



defmodule Si do
  def gdc(x, 0), do: x
  def gdc(0, y), do: y
  def gdc(x, y), do: rem(x, y)
end
