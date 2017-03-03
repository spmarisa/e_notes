# Pattern matching is a powerful part of Elixir. It allows us to match simple values, data structures, and even functions

# Match Operator
#Elixir, the = operator is actually a match operator, comparable to the equals sign in algebra. Writing it turns the whole expression into an equation and makes Elixir match the values on the left hand with the values on the right hand. If the match succeeds, it returns the value of the equation. Otherwise, it throws an error. Let’s take a look:

#Instead it’s like an assertion. It succeeds if Elixir can find a way of making the left-hand side equal the right-hand side. Elixir calls = a match operator.

#Erlang’s creator, compares the equals sign in Erlang to that used in algebra. When you write the equation x = a + 1, you are not assigning the value of a + 1 to x. Instead you’re simply asserting that the expressions x and a + 1 have the same value. If you know the value of x, you can work out the value of a, and vice versa.

x = 1
1 = x
2 = x

# The match operator is not only used to match against simple values, but it is also useful for destructuring more complex data types. For example, we can pattern match on tuples:
 {a, b, c} = {:hello, "world", 42}
 a
 b
 c

#A pattern match will raise error if the sides can’t be matched, if the tuples have different sizes, and also when comparing different types

{a, b, c} = {:hello, "world"}
{a, b, c} = [:hello, "world", 42]



# More interestingly, we can match on specific values. The example below asserts that the left side will only match the right side when the right side is a tuple that starts with the atom :ok:
{:ok, result} = {:ok, 13}
{:ok, result} = {:error, :oops}

#we can pattern match on list
[a, b, c] = [1, 2, 3]
a
b
c

# Similar to the hd/1 and tl/1 functions, we can’t match an empty list with a head and tail pattern:
[h | t] = []
# ** (MatchError) no match of right hand side value: []


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


# Pattern matching allows developers to easily destructure data types such as tuples and lists. As we will see in the following chapters, it is one of the foundations of recursion in Elixir and applies to other types as well, like maps and binaries.


#Pin Operator
# PIN OPERATOR - Elixir provides a way to always force pattern matching against the variable in the left hand side, the pin operator.
# We just learned the match operator performs assignment when the left side of the match includes a variable. In some cases this variable rebinding behavior is undesirable. For these situations we have the pin operator: ^.

# When we pin a variable we match on the existing value rather than rebinding to a new one. Let’s take a look at how this works:

# variables in elixir can be rebound
x = 1
x = 3
^x = 2

{y, ^x} = {2, 3}
y

{y, ^x} = {2, 2}

# If a variable is mentioned more than once in a pattern, all references should bind to the same pattern:
{x, x} = {1, 1}
{x, x} = {1, 2}


# In some cases, you don’t care about a particular value in a pattern. It is a common practice to bind those values to the underscore, _. For example, if only the head of the list matters to us, we can assign the tail to underscore:
[h | _] = [1, 2, 3]


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


list = [1, 2, 3]
[a, 2, b] = list

list = [14, 26, 332]
[a, _, b] = list


#VALUES BIND ONCE PER MATCH
[a, a] = [1, 1]
[b, b] = [1, 2]
