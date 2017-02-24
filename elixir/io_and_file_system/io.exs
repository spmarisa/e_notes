# The IO module is the main mechanism in Elixir for reading and writing to standard input/output (:stdio), standard error (:stderr), files, and other IO devices. Usage of the module is pretty straightforward:

 IO.puts "hello world"
# hello world
:ok
 IO.gets "yes or no? "
# yes or no? yes
# "yes\n"

# By default, functions in the IO module read from the standard input and write to the standard output. We can change that by passing, for example, :stderr as an argument (in order to write to the standard error device):

 IO.puts :stderr, "hello world"
# hello world
# :ok
