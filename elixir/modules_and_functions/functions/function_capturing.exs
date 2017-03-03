#Elixir often refers to functions in the format Module.function/arity.
#For example the to_atom function in the String module which takes one argument would be referred to as String.to_atom/1 in the documentation. When a reference to a function is needed, we can use the function capture syntax, using the capture operator &, as shown below to get a reference to a function.

fun_to_atom = &String.to_atom/1

:a = fun_to_atom.("a")

true = is_function(fun_to_atom)

# Function capturing is often used to pass functions as parameters
# to another function
[:a] = Enum.map(["a"], &String.to_atom/1)
#the capture operator & can also be used to create anonymous functions.
