#programming is about transforming data.
#elixir is immutable
#if a list is created that list cant change
langs = ["elixir", "c#", "js"]

#to add "c++" to that
List.insert_at(langs, 0, "c++")

#when we inserted a new element at 0 it took "c++" and placed a pointer to the languages list and returned a new list as that list

#benefits of immutaility
- handles concurrency very well with immutable data
  if we gave our list to 3 separate but concurrent process we dont have to worry about our one process causing problems with other processes
  any transform will result in new items

- efficient memory use - it know the memory locayion isnt going to change, so instead of copying the list into a new list into it will reuse it as part of another list
  in haskell variables are immutable
  counter = counter + 1 -> is not allowed
  in elixir u can
  elixir is rebinding the variable to new data

  langs = List.insert_at(langs, 0, "c++")


#You just have to remember that any function that transforms data will return a new copy of it
name = "elixir"
#"elixir"
cap_name = String.capitalize name
#"Elixir"
name
#"elixir"
