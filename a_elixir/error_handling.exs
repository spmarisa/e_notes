# Although more common to return the {:error, reason} tuple, Elixir supports exceptions and in this lesson we’ll look at how to handle errors and the different mechanisms available to us.

# In general the convention in Elixir is to create a function (example/1) which returns {:ok, result} and {:error, reason} and a separate function (example!/1) that returns the unwrapped result or raises an error.
# we will focus on interacting with the latter.

    # Error Handling
    # After
    # New Errors
    # Throws
    # Exiting

#####################################################################################################################################

# Error Handling
# Before we can handle errors we need to create them and the simplest way to do so is with raise/1:
raise("Oh no!")

# If we want to specify the type and message, we need to use raise/2:
raise ArgumentError, message: "the argument value is invalid"

# When we know an error may occur, we can handle it using try/rescue and pattern matching:
try do
 raise "Oh no!"
rescue
 e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
end

# It’s possible to match multiple errors in a single rescue:

try do
  opts
  |> Keyword.fetch!(:source_file)
  |> File.read!
rescue
  e in KeyError -> IO.puts "missing :source_file option"
  e in File.Error -> IO.puts "unable to read source file"
end


#####################################################################################################################################

# After
# At times it may be necessary to perform some action after our try/rescue regardless of error. For this we have try/after. If you’re familiar with Ruby this is akin to begin/rescue/ensure or in Java try/catch/finally:
try do
 raise "Oh no!"
rescue
 e in RuntimeError -> IO.puts("An error occurred: " <> e.message)
after
 IO.puts "The end!"
end
# An error occurred: Oh no!
# The end!
# :ok

# This is most commonly used with files or connections that should be closed:

{:ok, file} = File.open "example.json"
try do
   # Do hazardous work
after
   File.close(file)
end

#####################################################################################################################################

# New Errors
# While Elixir includes a number of builtin error types like RuntimeError, we maintain the ability to create our own if we need something specific. Creating a new error is easy with the defexception/1 macro which conveniently accepts the :message option to set a default error message:

defmodule ExampleError do
  defexception message: "an example error has occurred"
end

# Let’s take our new error for a spin:

try do
 raise ExampleError
rescue
 e in ExampleError -> e
end
# %ExampleError{message: "an example error has occurred"}

#####################################################################################################################################
# Throws
# Another mechanism for working with errors in Elixir is throw and catch. In practice these occur very infrequently in newer Elixir code but it’s important to know and understand them nonetheless.

# The throw/1 function gives us the ability to exit execution with a specific value we can catch and use:
try do
 for x <- 0..10 do
   if x == 5, do: throw(x)
   IO.puts(x)
 end
catch
 x -> "Caught: #{x}"
end
# 0
# 1
# 2
# 3
# 4
# "Caught: 5"


#####################################################################################################################################
# Exiting
 # Exit signals occur whenever a process dies and are an important part of the fault tolerance of Elixir.

spawn_link fn -> exit("oh no") end

# While it is possible to catch an exit with try/catch doing so is extremely rare. In almost all cases it is advantageous to let the supervisor handle the process exit:

try do
 exit "oh no!"
catch
 :exit, _ -> "exit blocked"
end
# "exit blocked"
