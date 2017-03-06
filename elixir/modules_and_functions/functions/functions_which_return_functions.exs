fun1 = fn -> fn -> "Hello" end end

fun1.()

fun1.().()

# The strange thing is the first line. It’s a little hard to read, so let’s spread it out.
fun1 = fn ->
          fn ->
              "Hello"
          end
       end


 fun1 = fn -> (fn -> "Hello" end) end
 other = fun1.()
 other.()




 # Functions Remember Their Original Environment
 greeter = fn name -> (fn -> "Hello #{name}" end) end
 dave_greeter = greeter.("Dave")
 dave_greeter.()



 add_n = fn n -> (fn other -> n + other end) end
 add_two = add_n.(2)
 add_five = add_n.(5)
 add_two.(3)
 add_five.(7)


a = fn(s1) -> fn(s2) -> "#{s1} #{s2}" end end

b = a.("banana")
b.("mango")
