# Tuples are similar to lists but are stored contiguously in memory. This makes accessing their length fast but modification expensive; the new tuple must be copied entirely to memory. Tuples are defined with curly braces:

# TUPLES is an immutable indexed array.
# They are fast to return its size and slow to append new values due its immutable nature.
# When updating a tuple, you are actually creating a whole new copy of the tuple self.
# Tuples are very often used as the return value of an array. While coding in Elixir you will very often see this, {:ok, something_else_here}.

#ordered collection - generally used for 2, 3 or 4 values. for bigger collection use lists or maps
#it can have different data types
{:ok, "line 1\nline 2\nline 3"}

book = {"elixir", "dave", 100}

#retreive data
elem(book, 2)

#puts new data
put_elem(book, 2, 200)
#above one doesnot update book tuple instead creates new tuple, in elixir data is immutable

#how pattern matching helps in tuples
book = {"elixir", "dave", 100}

author = elem(book, 1)

title = elem(book, 0)

{title1, author1, price1} = book

{title2, _, price3} = book

# It is common for tuples to be used as a mechanism to return additional information from functions; the usefulness of this will be more apparent when we get into pattern matching:
File.read("path/to/existing/file")
