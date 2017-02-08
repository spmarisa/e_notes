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
