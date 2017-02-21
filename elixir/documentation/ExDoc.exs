# ExDoc

# ExDoc is an official Elixir project that can be found on GitHub. It produces HTML (HyperText Markup Language) and online documentation for Elixir projects.

mix new greet_everyone

cd greet_everyone

# Now copy and paste the code from the @doc annotator lesson into a file called lib/greeter.ex and make sure everything is still working from the command line. Now that we are working within a Mix project we need to start IEx a little differently using the iex -S mix command sequence

iex -S mix

h Greeter.hello

# Installing

# Assuming all is well and we’re seeing the output above, we are now ready to set up ExDoc. In the mix.exs file, add the two required dependencies to get started: :earmark and :ex_doc.

[{:earmark, "~> 0.1", only: :dev},
    {:ex_doc, "~> 0.11", only: :dev}]

# add the above dependencies


mix deps.get # gets ExDoc + Earmark.
mix docs # makes the documentation.

# Docs successfully generated.
# View them at "doc/index.html".


# If everything went to plan, you should see a similar message as to the output message in the above example. Let’s now look inside our Mix project and we should see that there is another directory called doc/. Inside is our generated documentation. If we visit the index page in our browser we should see the following:
