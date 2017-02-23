# Compilation
# Scripted mode
# Named functions
# Function capturing
# Default arguments

# In Elixir we group several functions into modules. We’ve already used many different modules in the previous chapters such as the String module:

String.length("hello")
# 5

# In order to create our own modules in Elixir, we use the defmodule macro. We use the def macro to define functions in that module:


# Compilation

# Most of the time it is convenient to write modules into files so they can be compiled and reused. Let’s assume we have a file named math.ex with the following contents:

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

# This file can be compiled using elixirc:

# $ elixirc math.ex

# This will generate a file named Elixir.Math.beam containing the bytecode for the defined module. If we start iex again, our module definition will be available (provided that iex is started in the same directory the bytecode file is in):

Math.sum(1, 2)



# Elixir projects are usually organized into three directories:

#     ebin - contains the compiled bytecode
#     lib - contains elixir code (usually .ex files)
#     test - contains tests (usually .exs files)

# When working on actual projects, the build tool called mix will be responsible for compiling and setting up the proper paths for you. For learning purposes, Elixir also supports a scripted mode which is more flexible and does not generate any compiled artifacts


##########################################################################################################################

#scripted mode
# In addition to the Elixir file extension .ex, Elixir also supports .exs files for scripting. Elixir treats both files exactly the same way, the only difference is in intention. .ex files are meant to be compiled while .exs files are used for scripting. When executed, both extensions compile and load their modules into memory, although only .ex files write their bytecode to disk in the format of .beam files.

# For instance, we can create a file called math.exs:

defmodule Math do
  def sum(a, b) do
    a + b
  end
end

IO.puts Math.sum(1, 2)

# And execute it as:

# $ elixir math.exs

# The file will be compiled in memory and executed, printing “3” as the result. No bytecode file will be created. In the following examples, we recommend you write your code into script files and execute them as shown above.

##########################################################################################################################
