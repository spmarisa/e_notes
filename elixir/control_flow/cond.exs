# When we need to match conditions rather than values we can turn to cond; this is akin to else if or elsif from other languages:

#case is useful when you need to match against different values. However, in many circumstances, we want to check different conditions and find the first one that evaluates to true. In such cases, one may use cond:

cond do
 2 + 2 == 5 -> "This will not be true"
 2 * 2 == 3 -> "Nor this"
 1 + 1 == 2 -> "But this will"
end


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

cond do
 2 + 2 == 5 -> "This will not be true"
 2 * 2 == 3 -> "Nor this"
 1 + 1 == 2 -> "But this will"
end

# taking advantage of pattern matching

def day_abb3(:Monday), do: "M"
def day_abb3(:Tuesday), do: "T"
def day_abb3(_), do: "invalid"

# Like case, cond will raise an error if there is no match. To handle this, we can define a condition set to true:
cond do
 7 + 1 == 0 -> "Incorrect"
 true -> "Catch all"
end


# If none of the conditions return true, an error (CondClauseError) is raised. For this reason, it may be necessary to add a final condition, equal to true, which will always match:
cond do
 2 + 2 == 5 -> "This is never true"
 2 * 2 == 3 -> "Nor this"
 true -> "This is always true (equivalent to else)"
end


# Finally, note cond considers any value besides nil and false to be true:
cond do
 hd([1, 2, 3]) -> "1 is considered as true"
end
