#
import Kernel, except: [length: 1]

def length([]), do: 0

def length([_ | tail]),
  do: 1 + length(tail)


#TAIL RECURSION only happens when the last operation a function performs is recursion
#TAIL RECURSION doesnt overflow the stack

def other_length([_ | tail]),
  do: other_length(tail, 1)
def other_length([], len),
  do: len
def other_length([_ | tail], len),
  do: other_length(tail, len + 1)
