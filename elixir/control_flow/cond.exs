#if else doesnt handle a lot of nested cases
#cond is a macro

def day_abb(day) do
  if day == :Monday do
    "M"
  else
    if day == :Tuesday do
      "T"
    else
      "WoW"
    end
  end
end

def day_abb2(day) do
  cond do
    day == :Monday -> "M"
    day == :Tuesday -> "T"
    :true -> "Invalid"
  end
end

# taking advantage of pattern matching

def day_abb3(:Monday), do: "M"
def day_abb3(:Tuesday), do: "T"
def day_abb3(_), do: "invalid"
