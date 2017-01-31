defmodule Sample.Enum do

  # def first(list) do
  #     hd(list)
  # end

  # def first([]) do
  #   nil
  # end

  # def first([head | tail]) do
  # def first([head | _]) do
  #     head
  # end

  # def first([]), do: nil
  # def first([head | _]), do: head

  # def first([], val \\ nil), do: val

  # def first([head | _], val), do: head
  # def first([], val \\ nil), do: val

  def first(list, val \\ nil)
  def first([head | _], _), do: head
  def first([], val), do: val


  def add(list, val \\ 0) do
    trace(val)
    [val | list]
  end

  defp trace(string) do
      IO.puts("The value passed in was #{string}")
  end

end
