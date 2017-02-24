# Tasks

# Tasks build on top of the spawn functions to provide better error reports and introspection:

Task.start fn -> raise "oops" end
# {:ok, #PID<0.55.0>}

# 15:22:33.046 [error] Task #PID<0.55.0> started from #PID<0.53.0> terminating
# ** (RuntimeError) oops
#     (elixir) lib/task/supervised.ex:74: Task.Supervised.do_apply/2
#     (stdlib) proc_lib.erl:239: :proc_lib.init_p_do_apply/3
# Function: #Function<20.90072148/0 in :erl_eval.expr/5>
#     Args: []

# Instead of spawn/1 and spawn_link/1, we use Task.start/1 and Task.start_link/1 which return {:ok, pid} rather than just the PID. This is what enables tasks to be used in supervision trees. Furthermore, Task provides convenience functions, like Task.async/1 and Task.await/1, and functionality to ease distribution.

# We will explore those functionalities in the Mix and OTP guide, for now it is enough to remember to use Task to get better error reports.
