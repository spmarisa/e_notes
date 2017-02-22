# we will learn about @spec and @type syntax.
# First is more syntax complement for writing documentation that could be analyzed by tools. Second helps us to write more readable and easier to understand code.

# Introduction

# It’s not uncommon you would like to describe interface of your function. Of course You can use @doc annotation, but it is only information for other developers that is not checked in compilation time. For this purpose Elixir has @spec annotation to describe specification of function that will be checked by compiler.

# However in some cases specification is going to be quite big and complicated. If you would like to reduce complexity, you want to introduce custom type definition. Elixir has @type annotation for that. In the other hand, Elixir is still dynamic language. That means all information about type will be ignored by compiler, but could be used by other tools.

###################################################################################################################################
# Specification
# If you have experience with Java or Ruby you could think about specification as an interface. Specification defines what should be type of function parameters and return value.

# To define input and output types we use @spec directive placed right before function definition and taking as a params name of function, list of parameter types, and after :: type of return value.

@spec sum_product(integer) :: integer
def sum_product(a) do
    [1, 2, 3]
    |> Enum.map(fn el -> el * a end)
    |> Enum.sum
end

# Everything looks ok and when we call valid result will be return, but function Enum.sum returns number not integer as we expected in @spec. It could be source of bugs! There are tools like Dialyzer to static analysis of code that helps us to find this type of bugs. We will talk about them in another lesson.


###################################################################################################################################
# Custom types
#     Defining custom type
#     Documentation of types

# Writing specifications is nice, but sometimes our functions works with more complex data structures than simple numbers or collections. In that definition’s case in @spec it could be hard to understand and/or change for other developers.


# Sometimes functions need to take in a large number of parameters or return complex data. A long parameters list is one of many potential bad smells in one’s code. In object oriented-languages like Ruby or Java we could easily define classes that help us to solve this problem. Elixir hasn’t classes but because is easy to extends that we could define our types.

# Out of box Elixir contains some basic types like integer or pid.

# DEFINING CUSTOM TYPES

@spec sum_times(integer, %Examples{first: integer, last: integer}) :: integer
def sum_times(a, params) do
    for i <- params.first..params.last do
        i
    end
       |> Enum.map(fn el -> el * a end)
       |> Enum.sum
       |> round
end
