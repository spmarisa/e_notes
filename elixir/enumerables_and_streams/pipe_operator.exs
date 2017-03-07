# The pipe operator |> passes the result of an expression as the first parameter of another expression.
foo(bar(baz(new_function(other_function()))))
# The pipe takes the result on the left, and passes it to the right hand side.
other_function() |> new_function() |> baz() |> bar() |> foo()

"Elixir rocks" |> String.split

"Elixir rocks"
|> String.upcase
|> String.split

"elixir" |> String.ends_with?("ixir")


# Best Practices
# If the arity of a function is more than 1, then make sure to use parentheses. This doesn’t matter much to the Elixir, but it matters to other programmers who may misinterpret your code. If we take our 3rd example, and remove the brackets from String.ends_with?/2, we are met with the following warning.

foo 1 |> bar 2 |> baz 3
# is ambiguous and should be written as
foo(1) |> bar(2) |> baz(3)



Enum.sum(Enum.filter(Enum.map(1..100_000, &(&1 * 3)), odd?))

1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum



"a, b, c" |> String.split(",") |> Enum.map( &String.upcase/1 )

Enum.map(String.split("a,b,c", ","), &String.upcase/1)
