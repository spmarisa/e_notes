# Capturing an application’s output is possible with ExUnit.captureIO without changing the original application. Simply pass the function generating the output in:

defmodule OutputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "outputs Hello World" do
    assert capture_io(fn -> IO.puts "Hello World" end) == "Hello World\n"
  end
end

# ExUnit.CaptureLog is the equivalent for capturing output to Logger.
