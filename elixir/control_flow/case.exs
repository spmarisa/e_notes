# If it’s necessary to match against multiple patterns we can use case:
case {:ok, "baaaaaa"} do
 {:ok, result} -> result
 {:error} -> "Uh oh!"
 _ -> "Catch all"
end

# The _ variable is an important inclusion in case statements. Without it failure to find a match will raise an error:
case :even do
  :odd -> "Odd"
  _ -> "Not Odd"
end

# Since case relies on pattern matching, all of the same rules and restrictions apply. If you intend to match against existing variables you must use the pin ^ operator:

pie = 3.14
case "cherry pie" do
   ^pie -> "Not so tasty"
   pie -> "I bet #{pie} is tasty"
end

# Another neat feature of case is its support for guard clauses:

# This example comes directly from the official Elixir Getting Started guide.

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "Will match"
   _ ->
    "Won't match"
end





def day_abb4(day) do
  case day do
    :Monday -> "M"
    :Tuesday -> "T"
    _ -> "Invalid"
  end
end

def describe_date(date) do
  case date do
    {1, _, _} -> "Brand New Month"
    {25, 12, _} -> "Christmas"
    {25, month, _} -> "only #{12 - month} months till christmas"
    {31, 10, _} -> "Halloween"
    {31, 10, 1517} -> "reformtion"
    {_, month, _} when month <= 12 -> "Just an average month"
    {_, _, _} -> "Invalid month"
  end
end

def send_tweet(path) do
  case File.read(path) do
    {:ok, data} -> Tweet.send(data)
    {:error, error} -> IO.puts "nope"
  end
end

def day_abb2(day) do
  cond do
    day == :Monday -> "M"
    day == :Tuesday -> "T"
    :true -> "Invalid"
  end
end

def day_abb3(:Monday), do: "M"
def day_abb3(:Tuesday), do: "T"
def day_abb3(_), do: "invalid"
