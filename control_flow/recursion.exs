#recursive functions
# to understand what recurcion is, you must first understand recursion

#elixirs pattern matching makes recursion so much easier

#common case is iterating over a list

defmodule Recursion do

  def first([]), do: nil
  def first([head | _]), do: head


  def map([], _) do: []
  def map([hd | tl], f) do
    [f.(hd) | map(tl, f)]
  end

end
#still a big bloody question


#example
defmodule Sample.Lyrics do

  defp get_sentence(2) do
  end

  defp get_sentence(1) do
  end

  defp get_sentence(number) do
  end

  defp get_next_bottle(number) do
  end

  def lyrics(), do: lyrics(100..1)
  def lyrics(first..last) when first <= last,
    do: get_sentence(first)

  def lyrics(first..last),
    do: get_sentence(first) <> lyrics(first - 1..last)
end
