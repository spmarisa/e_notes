# defmodule ModulePlayground do
#   def say_here do
#     IO.puts "I'm Here too"
#   end
# end

defmodule ModulePlayground do
  # import IO
  import IO, only: [puts: 1]
  import Kernel, except: [inspect: 1]

  # alias ModulePlayground.Misc.Util.Math
  alias ModulePlayground.Misc.Util.Math, as: MyMath

  require Integer
  
  def say_here do
    # puts "I'm Here too"
    inspect "I'm Here too"
  end

  def inspect(param1) do
    puts "Starting Output"
    puts param1
    puts "Ending Output"
  end

  def print_sum do
    # ModulePlayground.Misc.Util.Math.add(1, 2)
    # Math.add(1, 2)
    MyMath.add(1, 2)
  end

  def print_is_even(num) do
    puts "is #{num} even? #{Integer.is_even(num)}"
  end
end
