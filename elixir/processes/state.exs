# We haven’t talked about state so far in this guide. If you are building an application that requires state, for example, to keep your application configuration, or you need to parse a file and keep it in memory, where would you store it?

# Processes are the most common answer to this question. We can write processes that loop infinitely, maintain state, and send and receive messages. As an example, let’s write a module that starts new processes that work as a key-value store in a file named kv.exs:

defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} -> send caller, Map.get(map, key)
      loop(map)
      {:put, key, value} -> loop(Map.put(map, key, value))
    end
  end
end

# Note that the start_link function starts a new process that runs the loop/1 function, starting with an empty map. The loop/1 function then waits for messages and performs the appropriate action for each message. In the case of a :get message, it sends a message back to the caller and calls loop/1 again, to wait for a new message. While the :put message actually invokes loop/1 with a new version of the map, with the given key and value stored.

# Let’s give it a try by running iex kv.exs:

{:ok, pid} = KV.start_link
# {:ok, #PID<0.62.0>}
send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
flush()
# nil
# :ok

# At first, the process map has no keys, so sending a :get message and then flushing the current process inbox returns nil. Let’s send a :put message and try it again:
send pid, {:put, :hello, :world}
# {:put, :hello, :world}
send pid, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
flush()
# :world
# :ok


# Notice how the process is keeping a state and we can get and update this state by sending the process messages. In fact, any process that knows the pid above will be able to send it messages and manipulate the state.

# It is also possible to register the pid, giving it a name, and allowing everyone that knows the name to send it messages:
Process.register(pid, :kv)
# true
send :kv, {:get, :hello, self()}
# {:get, :hello, #PID<0.41.0>}
flush()
# :world
# :ok

##########################################################################################################################
# Using processes to maintain state and name registration are very common patterns in Elixir applications. However, most of the time, we won’t implement those patterns manually as above, but by using one of the many abstractions that ship with Elixir. For example, Elixir provides agents, which are simple abstractions around state:

{:ok, pid} = Agent.start_link(fn -> %{} end)
# {:ok, #PID<0.72.0>}
Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
# :ok
Agent.get(pid, fn map -> Map.get(map, :hello) end)
# :world

# A :name option could also be given to Agent.start_link/2 and it would be automatically registered. Besides agents, Elixir provides an API for building generic servers (called GenServer), tasks, and more, all powered by processes underneath. Those, along with supervision trees, will be explored with more detail in the Mix and OTP guide which will build a complete Elixir application from start to finish.


#AGENTS ARE SIMPLE ABSTRACTIONS AROUND STATE
