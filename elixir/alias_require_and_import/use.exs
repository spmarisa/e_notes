# Although not a directive, use is a macro tightly related to require that allows you to use a module in the current context. The use macro is frequently used by developers to bring external functionality into the current lexical scope, often modules.

# For example, in order to write tests using the ExUnit framework, a developer should use the ExUnit.Case module:

defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "always pass" do
    assert true
  end
end

# Behind the scenes, use requires the given module and then calls the __using__/1 callback on it allowing the module to inject some code into the current context. Generally speaking, the following module:

defmodule Example do
  use Feature, option: :value
end

# is compiled into

defmodule Example do
  require Feature
  Feature.__using__(option: :value)
end
