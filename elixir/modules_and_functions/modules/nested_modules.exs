# Now that we have talked about aliases, we can talk about nesting and how it works in Elixir. Consider the following example:

defmodule Foo do
  defmodule Bar do
  end
end

# The example above will define two modules: Foo and Foo.Bar. The second can be accessed as Bar inside Foo as long as they are in the same lexical scope. The code above is exactly the same as:

defmodule Elixir.Foo do
  defmodule Elixir.Foo.Bar do
  end
  alias Elixir.Foo.Bar, as: Bar
end

# If, later, the Bar module is moved outside the Foo module definition, it must be referenced by its full name (Foo.Bar) or an alias must be set using the alias directive discussed above.

# Note: in Elixir, you don’t have to define the Foo module before being able to define the Foo.Bar module, as the language translates all module names to atoms. You can define arbitrarily-nested modules without defining any module in the chain (e.g., Foo.Bar.Baz without defining Foo or Foo.Bar first).

# As we will see in later chapters, aliases also play a crucial role in macros, to guarantee they are hygienic.
