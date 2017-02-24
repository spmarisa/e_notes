# You may have noticed that File.open/2 returns a tuple like {:ok, pid}:

{:ok, file} = File.open "hello", [:write]
# {:ok, #PID<0.47.0>}

# That happens because the IO module actually works with processes (see chapter 11). When you write IO.write(pid, binary), the IO module will send a message to the process identified by pid with the desired operation. Let’s see what happens if we use our own process:

pid = spawn fn ->
  receive do: (msg -> IO.inspect msg)
end
#PID<0.57.0>
IO.write(pid, "hello")
# {:io_request, #PID<0.41.0>, #Reference<0.0.8.91>,
#  {:put_chars, :unicode, "hello"}}
# ** (ErlangError) erlang error: :terminated

# After IO.write/2, we can see the request sent by the IO module (a four-elements tuple) printed out. Soon after that, we see that it fails since the IO module expected some kind of result that we did not supply.

# The StringIO module provides an implementation of the IO device messages on top of strings:

{:ok, pid} = StringIO.open("hello")
# {:ok, #PID<0.43.0>}
IO.read(pid, 2)
# "he"

# By modelling IO devices with processes, the Erlang VM allows different nodes in the same network to exchange file processes in order to read/write files in between nodes. Of all IO devices, there is one that is special to each process: the group leader.

# When you write to :stdio, you are actually sending a message to the group leader, which writes to the standard-output file descriptor:

IO.puts :stdio, "hello"
# hello
# :ok
IO.puts Process.group_leader, "hello"
# hello
# :ok

# The group leader can be configured per process and is used in different situations. For example, when executing code in a remote terminal, it guarantees messages in a remote node are redirected and printed in the terminal that triggered the request.
