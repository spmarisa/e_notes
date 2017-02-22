# Pattern matching is a powerful part of Elixir. It allows us to match simple values, data structures, and even functions

# Match Operator
#Elixir, the = operator is actually a match operator, comparable to the equals sign in algebra. Writing it turns the whole expression into an equation and makes Elixir match the values on the left hand with the values on the right hand. If the match succeeds, it returns the value of the equation. Otherwise, it throws an error. Let’s take a look:

x = 1
1 = x
2 = x

# The match operator is not only used to match against simple values, but it is also useful for destructuring more complex data types. For example, we can pattern match on tuples:
 {a, b, c} = {:hello, "world", 42}
 a
 b
 c

#A pattern match will raise error if the sides can’t be matched, if the tuples have different sizes, and also when comparing different types

list = [1, 2, 3]
[1, 2, 3] = list
[] = list

[1|tail] = list
tail
[2|_] = list

# Tuples
{:ok, value} = {:ok, "Successful!"}
value
"Successful!"
{:ok, value} = {:error}


#Pin Operator
# PIN OPERATOR - Elixir provides a way to always force pattern matching against the variable in the left hand side, the pin operator.
# We just learned the match operator performs assignment when the left side of the match includes a variable. In some cases this variable rebinding behavior is undesirable. For these situations we have the pin operator: ^.

# When we pin a variable we match on the existing value rather than rebinding to a new one. Let’s take a look at how this works:
x = 1
^x = 2
{x, ^x} = {2, 1}
x

key = "hello"
%{^key => value} = %{"hello" => "world"}
value
%{^key => value} = %{:hello => "world"}

greeting = "Hello"
greet = fn
 (^greeting, name) -> "Hi #{name}"
 (greeting, name) -> "#{greeting}, #{name}"
end
#Function<12.54118792/2 in :erl_eval.expr/5>
greet.("Hello", "Sean")
# "Hi Sean"
greet.("Mornin'", "Sean")
# "Mornin', Sean"
