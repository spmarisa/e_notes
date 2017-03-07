list = Enum.to_list(1..5)

Enum.concat([1,2,3], [4,5,6])

Enum.concat([1,2,3], 'abc')

# Create collections whose elements are some function of the original:
Enum.map(list, &(&1 * 10))

Enum.map(list, &String.duplicate("*", &1))


#SELECT ELEMENTS BY POSITION OR CRITERIA

Enum.at(10..20, 3)
# 13
Enum.at(10..20, 20)
# nil
Enum.at(10..20, 20, :no_one_here)
# :no_one_here
Enum.filter(list, &(&1 > 2))
# [3, 4, 5]
require Integer
Enum.filter(list, &Integer.is_even/1)
# [2, 4]
Enum.reject(list, &Integer.is_even/1)
# [1, 3, 5]



#SORT AND COMPARE ELEMENTS
Enum.sort ["there", "was", "a", "crooked", "man"]
# ["a", "crooked", "man", "there", "was"]

Enum.sort ["there", "was", "a", "crooked", "man"], &(String.length(&1) <= String.length(&2))
# ["a", "was", "man", "there", "crooked"]


Enum.max ["there", "was", "a", "crooked", "man"]
# "was"

Enum.max_by ["there", "was", "a", "crooked", "man"], &String.length/1
# "crooked"





#SPLIT A COLLECTION
Enum.take(list, 3)
# [1, 2, 3]
Enum.take_every list, 2
# [1, 3, 5]
Enum.take_while(list, &(&1 < 4))
# [1, 2, 3]
Enum.split(list, 3)
# {[1, 2, 3], [4, 5]}
Enum.split_while(list, &(&1 < 4))
# {[1, 2, 3], [4, 5]}




#JOIN A COLLECTION
Enum.join(list)
# "12345"
Enum.join(list, ", ")
# "1, 2, 3, 4, 5"




#FOLD ELEMENTS INTO A SINGLE VALUE
Enum.reduce(1..100, &(&1+&2))



#DEAL A CARD OF HANDS
import Enum

deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]

deck |> shuffle |> take(13)

hands = deck |> shuffle |> chunk(13)




[ 1, 2, 3, 4, 5 ] |> Enum.map(&(&1*&1)) |> Enum.with_index |> Enum.map(fn {value, index} -> value - index end) |> IO.inspect
