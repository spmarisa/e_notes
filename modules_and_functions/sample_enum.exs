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

  def first([head | _]), do: head
  def first([], val \\ 0), do: val



  def add(list, val \\ 0) do
    [val | list]
  end

end
