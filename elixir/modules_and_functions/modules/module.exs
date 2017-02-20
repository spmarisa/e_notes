# Modules
# Modules are the best way to organize functions into a namespace. In addition to grouping functions, they allow us to define named and private functions which we covered in the previous lesson.
defmodule Example do
  def greeting(name) do
    "Hello #{name}."
  end
end

Example.greeting("Sean")

# It is possible to nest modules in Elixir, allowing you to further namespace your functionality:
defmodule Example.Greetings do
  def morning(name) do
    "Good morning #{name}."
  end

  def evening(name) do
    "Good night #{name}."
  end
end

Example.Greetings.morning("Sean")


# Module Attributes
# Module attributes are most commonly used as constants in Elixir.

defmodule Example do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end

Example.greeting("stormrage")
# It is important to note there are reserved attributes in Elixir. The three most common are:
#
#     moduledoc — Documents the current module.
#     doc — Documentation for functions and macros.
#     behaviour — Use an OTP or user-defined behaviour.
