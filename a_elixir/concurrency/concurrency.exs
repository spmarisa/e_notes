# Concurrency
# One of the selling points of Elixir is its support for concurrency. Thanks to the Erlang VM (BEAM), concurrency in Elixir is easier than expected.
# The concurrency model relies on Actors, a contained process that communicates with other processes through message passing.

# In this lesson we’ll look at the concurrency modules that ship with Elixir. In the following chapter we cover the OTP behaviors that implement them.

    # Processes
    #     Message Passing
    #     Process Linking
    #     Process Monitoring
    # Agents
    # Tasks

######################################################################################################################################
# Processes

# Processes in the Erlang VM are lightweight and run across all CPUs. While they may seem like native threads, they’re simpler and it’s not uncommon to have thousands of concurrent processes in an Elixir application.

# The easiest way to create a new process is spawn, which takes either an anonymous or named function. When we create a new process it returns a Process Identifier, or PID, to uniquely identify it within our application.

# To start we’ll create a module and define a function we’d like to run:

defmodule Example do
  def add(a, b) do
    IO.puts(a + b)
  end
end

Example.add(2, 3)
5
:ok

# To evaluate the function asynchronously we use spawn/3:

spawn(Example, :add, [2, 3])
5
#PID<0.80.0>
######################################################################################################################################
# Message Passing

# To communicate, processes rely on message passing. There are two main components to this: send/2 and receive. The send/2 function allows us to send messages to PIDs. To listen we use receive to match messages. If no match is found the execution continues uninterrupted.

defmodule Example do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "World"
    end

    listen
  end
end

pid = spawn(Example, :listen, [])
#PID<0.108.0>

send pid, {:ok, "hello"}
World
{:ok, "hello"}

send pid, :ok
:ok

# You may notice that the listen/0 function is recursive, this allows our process to handle multiple messages. Without recursion our process would exit after handling the first message.
#####################################################################################################################################

# Process Linking
# One problem with spawn is knowing when a process crashes. For that we need to link our processes using spawn_link. Two linked processes will receive exit notifications from one another:

defmodule Example do
  def explode, do: exit(:kaboom)
end

spawn(Example, :explode, [])
#PID<0.66.0>

spawn_link(Example, :explode, [])
** (EXIT from #PID<0.57.0>) :kaboom

# Sometimes we don’t want our linked process to crash the current one. For that we need to trap the exits. When trapping exits they will be received as a tuple message: {:EXIT, from_pid, reason}.

defmodule Example do
  def explode, do: exit(:kaboom)
  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Example, :explode, [])

    receive do
      {:EXIT, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end
  end
end

Example.run
# Exit reason: kaboom
# :ok

#####################################################################################################################################
# Process Monitoring

# What if we don’t want to link two processes but still be kept informed? For that we can use process monitoring with spawn_monitor. When we monitor a process we get a message if the process crashes without our current process crashing or needing to explicitly trap exits.

defmodule Example do
  def explode, do: exit(:kaboom)
  def run do
    {pid, ref} = spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, ref, :process, from_pid, reason} -> IO.puts "Exit reason: #{reason}"
    end
  end
end

Example.run
# Exit reason: kaboom
# :ok

#####################################################################################################################################
