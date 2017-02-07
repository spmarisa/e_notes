#ordered collection - generally used for 2, 3 or 4 values. for bigger collection use lists or maps
#it can have different data types

{:ok, "line 1\nline 2\nline 3"}

book = {"elixir", "dave", 100}

#retreive data
elem(book, 2)

#puts new data
put_elem(book, 2, 200)

#above one doesnot update book tuple instead creates new tuple

#in elixir data is immutable

#how pattern matching helps in tuples
book = {"elixir", "dave", 100}

author = elem(book, 1)

title = elem(book, 0)

{title1, author1, price1} = book

{title2, _, price3} = book
