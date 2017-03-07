defmodule Example do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end
end

Example.func("a", "b")
Example.func("a", "b", "c")
Example.func("a", "b", "c", "d")




defmodule DefaultParams1 do
  def func(p1, p2 \\ 123) do
    IO.inspect [p1, p2]
  end

  def func(p1, 99) do
    IO.puts "you said 99"
  end
end



defmodule Params do
  def func(p1, p2 \\ 123)

  def func(p1, p2) when is_list(p1) do
    "You said #{p2} with a list"
  end

  def func(p1, p2) do
    "You passed in #{p1} and #{p2}"
  end
end

IO.puts Params.func(99)
IO.puts Params.func(99, "cat")
IO.puts Params.func([99])
IO.puts Params.func([99], "dog")






defmodule Chop do
  def guess(n, a..b) do
    c = b / 2
    it()
  end

  def it(a, b) do
  end

  def it(a, b) do
  end
end

Chop.guess(273, 1..1000)
