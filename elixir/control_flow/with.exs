# with
# The special form with is useful when you might use a nested case statement or situations that cannot cleanly be piped together. The with expression is composed of the keyword, generators, and finally an expression.

# We’ll discuss generators more in the List Comprehensions lesson but for now we only need to know they use pattern matching to compare the right side of the <- to the left.

# We’ll start with a simple example of with and then look at something more:

user = %{first: "Sean", last: "Callan"}
with {:ok, first} <- Map.fetch(user, :first),
      {:ok, last} <- Map.fetch(user, :last),
      do: last <> ", " <> first

# In the event that an expression fails to match, the non-matching value will be returned:

user = %{first: "doomspork"}
with {:ok, first} <- Map.fetch(user, :first),
      {:ok, last} <- Map.fetch(user, :last),
      do: last <> ", " <> first

# Now let’s look at a larger example without with and then see how we can refactor it:

case Repo.insert(changeset) do
  {:ok, user} ->
    case Guardian.encode_and_sign(resource, :token, claims) do
      {:ok, jwt, full_claims} ->
        important_stuff(jwt, full_claims)
      error -> error
    end
  error -> error
end

# When we introduce with we end up with code that is easy to understand and has fewer lines:

with
  {:ok, user} <- Repo.insert(changeset)
  {:ok, jwt, full_claims} <- Guardian.encode_and_sign(user, :token)
  do: important_stuff(jwt, full_claims)
# As of Elixir 1.3, with statements support else:

import Integer

m = %{a: 1, c: 3}

a = with {:ok, res} <- Map.fetch(m, :a),
  true <- Integer.is_even(res) do
    IO.puts "Divided by 2 it is #{div(res, 2)}"
else
  :error -> IO.puts "We don't have this item in map"
  _ -> IO.puts "It's not odd"
end

# It helps to handle errors by providing case-like pattern matching in it. The value passed is the first non-matched expression.
