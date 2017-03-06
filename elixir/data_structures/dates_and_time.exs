# There are two date/time types, DateTime and NaiveDateTime . The naive version contains just a date and a time; DateTime adds the ability to associate a time zone. The ~N[...] sigil constructs NaiveDateTime structs.


d1 = Date.new(2016, 12, 25)
# {:ok, ~D[2016-12-25]}
{:ok, d1} = Date.new(2016, 12, 25)
# {:ok, ~D[2016-12-25]}
d2 = ~D[2016-12-25]
# ~D[2016-12-25]
d1 == d2
# true
d1
# ~D[2016-12-25]
inspect d1, structs: false
# "%{__struct__: Date, calendar: Calendar.ISO, day: 25, month: 12, year: 2016}"


# The Time type contains an hour, minute, second, and fractions of a second. The fraction is stored as a tuple containing microseconds and the number of significant digits.

t1 = Time.new(12, 34, 56)
# {:ok, ~T[12:34:56]}
t2 = ~T[12:34:56.78]
# ~T[12:34:56.78]
t1 == t2
# false
inspect t2, structs: false
# "%{__struct__: Time, hour: 12, microsecond: {780000, 2}, minute: 34, second: 56}"
