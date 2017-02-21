# Agents

# Agents are an abstraction around background processes maintaining state. We can access them from other processes within our application and node. The state of our Agent is set to our function’s return value:

{:ok, agent} = Agent.start_link(fn -> [1, 2, 3] end)
# {:ok, #PID<0.65.0>}

Agent.update(agent, fn (state) -> state ++ [4, 5] end)
# :ok

Agent.get(agent, &(&1))
# [1, 2, 3, 4, 5]

# When we name an Agent we can refer to it by that instead of its PID:
Agent.start_link(fn -> [1, 2, 3] end, name: Numbers)
# {:ok, #PID<0.74.0>}

Agent.get(Numbers, &(&1))
# [1, 2, 3]
