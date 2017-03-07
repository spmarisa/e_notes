# it allows you to build a collection by inserting elements into it.
# Not all collections are collectable. Ranges, for example, cannot have new entries added to them.


# inject the elements of a range into an empty list
Enum.into 1..5, []

Enum.into 1..5, [100, 101 ]

#output streams are collectable
Enum.into IO.stream(:stdio, :line), IO.stream(:stdio, :line)
