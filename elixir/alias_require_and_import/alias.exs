# alias allows you to set up aliases for any given module name.

# Imagine a module uses a specialized list implemented in Math.List. The alias directive allows referring to Math.List just as List within the module definition:

defmodule Stats do
  alias Math.List, as: List
  # In the remaining module definition List expands to Math.List.
end

# The original List can still be accessed within Stats by the fully-qualified name Elixir.List.

# Note: All modules defined in Elixir are defined inside a main Elixir namespace. However, for convenience, you can omit “Elixir.” when referencing them.

##########################################################################################################################

# Aliases are frequently used to define shortcuts. In fact, calling alias without an :as option sets the alias automatically to the last part of the module name, for example:

alias Math.List

# Is the same as:

alias Math.List, as: List

# Note that alias is lexically scoped, which allows you to set aliases inside specific functions:
defmodule Math do
  def plus(a, b) do
    alias Math.List
    # ...
  end

  def minus(a, b) do
    # ...
  end
end

##########################################################################################################################
# what exactly is an Elixir alias and how is it represented?
# An alias in Elixir is a capitalized identifier (like String, Keyword, etc) which is converted to an atom during compilation. For instance, the String alias translates by default to the atom :"Elixir.String":

is_atom(String)
# true
to_string(String)
# "Elixir.String"
:"Elixir.String" == String
# true

# By using the alias/2 directive, we are changing the atom the alias expands to.

# Aliases expand to atoms because in the Erlang VM (and consequently Elixir) modules are always represented by atoms. For example, that’s the mechanism we use to call Erlang modules:

:lists.flatten([1, [2], 3])
# [1, 2, 3]
