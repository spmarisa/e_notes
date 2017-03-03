# We use import whenever we want to easily access functions or macros from other modules without using the fully-qualified name. For instance, if we want to use the duplicate/2 function from the List module several times, we can import it:

import List, only: [duplicate: 2]
# List
duplicate :ok, 3

# In this case, we are importing only the function duplicate (with arity 2) from List. Although :only is optional, its usage is recommended in order to avoid importing all the functions of a given module inside the namespace. :except could also be given as an option in order to import everything in a module except a list of functions.

# import also supports :macros and :functions to be given to :only. For example, to import all macros, one could write:

import Integer, only: :macros

# Or to import all functions, you could write:

import Integer, only: :functions

# Note that import is lexically scoped too. This means that we can import specific macros or functions inside function definitions:

defmodule Math do
  def some_function do
    import List, only: [duplicate: 2]
    duplicate(:ok, 10)
  end
end

# In the example above, the imported List.duplicate/2 is only visible within that specific function. duplicate/2 won’t be available in any other function in that module (or any other module for that matter).

# Note that importing a module automatically requires it.


"ABC" = String.upcase("abc")

# Import a single function with the form
# import Module, only: [function_name: arity]
import String, only: [upcase: 1]

# upcase can now be used without the module name
"ABC" = upcase("abc")
