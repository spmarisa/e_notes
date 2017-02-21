# In some instances it may be necessary to perform setup before our tests. To accomplish this we can use the setup and setup_all macros. setup will be run before each test and setup_all once before the suite. It is expected that they will return a tuple of {:ok, state}, the state will be available to our tests.

# For the sake of example, we’ll change our code to use setup_all:

defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  setup_all do
    {:ok, number: 2}
  end

  test "the truth", state do
    assert 1 + 1 == state[:number]
  end
end


#MOCKING
# The simple answer to mocking in Elixir is: don’t. You may instinctively reach for mocks but they are highly discouraged in the Elixir community and for good reason.

# For a longer discussion there is this excellent article. The gist is, that instead of mocking away dependencies for testing (mock as a verb), it has many advantages to explicitly define interfaces (behaviors) for code outside your application and using Mock (as a noun) implementations in your client code for testing.

# To switch the implementations in your application code, the preferred way is to pass the module as arguments and use a default value. If that does not work, use the built-in configuration mechanism. For creating these mock implementations, you don’t need a special mocking library, only behaviours and callbacks.
