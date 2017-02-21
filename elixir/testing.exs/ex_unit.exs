# ExUnit
#     assert
#     refute
#     assert_raise
#     assert_receive

# Elixir’s built-in test framework is ExUnit and it includes everything we need to thoroughly test our code. Before moving on it is important to note that tests are implemented as Elixir scripts so we need to use the .exs file extension. Before we can run our tests we need to start ExUnit with ExUnit.start(), this is most commonly done in test/test_helper.exs.

# When we generated our example project in the previous lesson, mix was helpful enough to create a simple test for us, we can find it at test/example_test.exs:

# We can run our project’s tests with mix test. If we do that now we should see an output similar to:



# assert

# If you’ve written tests before then you’re familiar with assert; in some frameworks "should" or "expect" fill the role of assert.

# We use the assert macro to test that the expression is true. In the event that it is not, an error will be raised and our tests will fail. To test a failure let’s change our sample and then run mix test:

defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "the truth" do
    assert 1 + 1 == 3
  end
end

# Now we should see a different kind of output:
#
#   1) test the truth (ExampleTest)
#      test/example_test.exs:5
#      Assertion with == failed
#      code: 1 + 1 == 3
#      lhs:  2
#      rhs:  3
#      stacktrace:
#        test/example_test.exs:6
#
# ......
#
# Finished in 0.03 seconds (0.02s on load, 0.01s on tests)
# 1 tests, 1 failures
#
# ExUnit will tells us exactly where our failed assertions are, what the expected value was, and what the actual value was.

######################################################################################################################################
# refute
# refute is to assert as unless is to if. Use refute when you want to ensure a statement is always false.

######################################################################################################################################
# assert_raise

# Sometimes it may be necessary to assert that an error has been raised. We can do this with assert_raise. We’ll see an example of assert_raise in the next lesson on Plug.

######################################################################################################################################
# assert_receive

# In Elixir applications consist of actors/processes that send messages to each other, thus often you want to test the messages being sent. Since ExUnit runs in its own process it can receive messages just like any other process and you can assert on it with the assert_received macro:

defmodule SendingProcess do
  def run(pid) do
    send pid, :ping
  end
end

defmodule TestReceive do
  use ExUnit.Case

  test "receives ping" do
    SendingProcess.run(self)
    assert_received :ping
  end
end

# assert_received does not wait for messages, with assert_receive you can specify a timeout.s
