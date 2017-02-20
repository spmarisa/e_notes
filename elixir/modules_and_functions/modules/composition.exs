# Composition
# Now that we know how to create modules and structs let’s learn how to add existing functionality to them via composition. Elixir provides us with a variety of different ways to interact with other modules.

# alias
# Allows us to alias module names; used quite frequently in Elixir code:

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example do
  alias Sayings.Greetings
  def greeting(name), do: Greetings.basic(name)
end

# Without alias
defmodule Example do
  def greeting(name), do: Sayings.Greetings.basic(name)
end

# If there’s a conflict between two aliases or we just wish to alias to a different name entirely, we can use the :as option:
defmodule Example do
  alias Sayings.Greetings, as: Hi
  def print_message(name), do: Hi.basic(name)
end

# It’s even possible to alias multiple modules at once:
defmodule Example do
  alias Sayings.{Greetings, Farewells}
end



# import
# If we want to import functions and macros rather than aliasing the module we can use import/:
last([1, 2, 3])
import List
last([1, 2, 3])



# Filtering
# By default all functions and macros are imported but we can filter them using the :only and :except options.
# To import specific functions and macros, we must provide the name/arity pairs to :only and :except. Let’s start by importing only the last/1 function:
import List, only: [last: 1]
first([1, 2, 3])
last([1, 2, 3])

# If we import everything except last/1 and try the same functions as before:
import List, except: [last: 1]
first([1, 2, 3])
last([1, 2, 3])

# In addition to the name/arity pairs there are two special atoms, :functions and :macros, which import only functions and macros respectively:
import List, only: :functions
import List, only: :macros



# require
# Although used less frequently require/2 is nonetheless important. Requiring a module ensures that it is compiled and loaded. This is most useful when we need to access a module’s macros:
defmodule Example do
  require SuperMacros
  SuperMacros.do_stuff
end
# If we attempt to call a macro that is not yet loaded Elixir will raise an error.



# use
# The use macro invokes a special macro, called __using__/1, from the specified module. Here’s an example:

# lib/use_import_require/use_me.ex
defmodule UseImportRequire.UseMe do
  defmacro __using__(_) do
    quote do
      def use_test do
        IO.puts "use_test"
      end
    end
  end
end

# and we add this line to UseImportRequire:
use UseImportRequire.UseMe

# Using UseImportRequire.UseMe defines a use_test/0 function through invocation of the __using__/1 macro.

# This is all that use does. However, it is common for the __using__ macro to in turn call alias, require, or import. This in turn will create aliases or imports in the using module. This allows the module being used to define a policy for how its functions and macros should be referenced. This can be quite flexible in that __using__/1 may set up references to other modules, especially submodules.

# The Phoenix framework makes use of use and __using__/1 to cut down on the need for repetitive alias and import calls in user defined modules.

# Here’s an nice and short example from the Ecto.Migration module:

defmacro __using__(_) do
  quote location: :keep do
    import Ecto.Migration
    @disable_ddl_transaction false
    @before_compile Ecto.Migration
  end
end

# The Ecto.Migration.__using__/1 macro includes an import call so that when you use Ecto.Migration you also import Ecto.Migration. It also sets up a module property which we will assume controls Ecto’s behavior.

# To recap: the use macro simply invokes the __using__/1 macro of the specified module. To really understand what that does you need to read the __using__/1 macro.

# Note: quote, alias, use, require are a macro used when we work with metaprogramming.
