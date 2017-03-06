# Functions are just values, so we can pass them to other functions.

times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end
apply.(times_2, 6)



list = [1, 3, 5, 7, 9]
# [1, 3, 5, 7, 9]
Enum.map list, fn elem -> elem * 2 end
# [2, 6, 10, 14, 18]
Enum.map list, fn elem -> elem * elem end
# [1, 9, 25, 49, 81]
Enum.map(list, fn elem -> elem > 6 end)
# [false, false, false, true, true]



defmodule Greeter do
  def for(name, greeting) do
    fn
      (^name) -> "#{greeting} #{name}"
      (_) -> "I don't know you"
    end
  end
end

mr_valim = Greeter.for("José", "Oi!")
IO.puts mr_valim.("José")
IO.puts mr_valim.("dave")
# In this example, the Greeter.for function returns a function with two heads. The first he
