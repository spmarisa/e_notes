# One of the added benefits to building on top of the Erlang VM (BEAM) is the plethora of existing libraries available to us. Interoperability allows us to leverage those libraries and the Erlang standard lib from our Elixir code.how to access functionality in the standard lib along with third-party Erlang packages.

# Standard Library
# Erlang Packages
# Notable Differences
#     Atoms
#     Strings
#     Variables


# Standard Library
# Erlang's exteensive standard library can be accessed from any elixir code in our app. Erlang modules are represented by lowecase atoms such as :os and :timer
# Let’s use :timer.tc to time execution of a given function:

defmodule Example do
  def timed(fun, args) do
    {time, result} = :timer.tc(fun, args)
    IO.puts "Time: #{time}ms"
    IO.puts "Result: #{result}"
  end
end

Example.timed(fn (n) -> (n * n) * n end, [100])
# Time: 8ms
# Result: 1000000




# Erlang Packages

# In a prior lesson we covered Mix and managing our dependencies. Including Erlang libraries works the same way. In the event the Erlang library has not been pushed to Hex you can refer to the git repository instead:

def deps do
  [{:png, github: "yuce/png"}]
end

# Now we can access our Erlang library:

png = :png.create(%{:size => {30, 30},
                    :mode => {:indexed, 8},
                    :file => file,
                    :palette => palette})




# Notable Differences

# Now that we know how to use Erlang we should cover some of the gotchas that come with Erlang interoperability.

#Atoms
# Erlang atoms look much like their Elixir counterparts without the colon (:). They are represented by lowercase strings and underscores:

Elixir => :example

Erlang => example.

#Strings
#In Elixir when we talk about strings we mean UTF-8 encoded binaries. In Erlang, strings still use double quotes but refer to char lists:

Elixir:

is_list('Example')
# true
is_list("Example")
# false
is_binary("Example")
# true
<<"Example">> === "Example"
# true

Erlang:

is_list('Example').
# false
is_list("Example").
# true
is_binary("Example").
# false
is_binary(<<"Example">>).
# true

# It’s important to note that many older Erlang libraries may not support binaries so we need to convert Elixir strings to char lists. Thankfully this is easy to accomplish with the to_charlist/1 function:

:string.words("Hello World")
# ** (FunctionClauseError) no function clause matching in :string.strip_left/2
#     (stdlib) string.erl:380: :string.strip_left("Hello World", 32)
#     (stdlib) string.erl:378: :string.strip/3
#     (stdlib) string.erl:316: :string.words/2

"Hello World" |> to_charlist |> :string.words
# 2



#Variables

Elixir:
x = 10
# 10
x1 = x + 10
# 20

Erlang:
X = 10.
# 10
X1 = X + 1.
# 11

# That’s it! Leveraging Erlang from within our Elixir applications is easy and effectively doubles the number of libraries available to us.
