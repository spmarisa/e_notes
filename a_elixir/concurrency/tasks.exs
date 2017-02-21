# Tasks

# Tasks provide a way to execute a function in the background and retrieve its return value later. They can be particularly useful when handling expensive operations without blocking the application execution.

defmodule Example do
  def double(x) do
    :timer.sleep(2000)
    x * 2
  end
end

task = Task.async(Example, :double, [2000])
# %Task{pid: #PID<0.111.0>, ref: #Reference<0.0.8.200>}

# Do some work

Task.await(task)
# 4000
