# Custom Mix Tasks

# It’s not uncommon to want to extend your Elixir applications functionality by adding custom Mix tasks. Before we learn about how to create specific Mix tasks for our projects, let’s look at one that already exists:

# mix phoenix.new my_phoenix_app

# As we can see from the shell command above, The Phoenix Framework has a custom Mix task to generate a new project. What if we could create something similar for our project? Well the great news is we can, and Elixir makes this easy for us to do.


#change the code in hello/lib/hello.ex


# Custom Mix Task
# Let’s create our custom Mix task. Create a new directory and file hello/lib/mix/tasks/hello.ex. Within this file, let’s insert these 7 lines of Elixir.

defmodule Mix.Tasks.Hello do
  use Mix.Task

  @shortdoc "Simply runs the Hello.say/0 command."
  def run(_) do
    Hello.say # calling our Hello.say() function from earlier
  end
end

# Mix Tasks in Action

# Let’s checkout our mix task. As long as we are in the directory it should work. From the command line, run mix hello, and we should see the following:

mix hello
# Hello, World!

# Mix is quite friendly by default. It knows that everyone can make a spelling error now and then, so it uses a technique called fuzzy string matching to make recommendations:

mix hell
# ** (Mix) The task "hell" could not be found. Did you mean "hello"?

# Did you also notice that we introduced an new module attribute, @shortdoc? This comes in handy when shipping our application, such as when a user runs the mix help command from the terminal.

mix help

# mix app.start         # Starts all registered apps
# ...
# mix hello             # Simply calls the Hello.say/0 function.
# ...
