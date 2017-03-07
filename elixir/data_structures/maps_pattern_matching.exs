# Do you have the following keys (and maybe values)?
person = %{ name: "Dave", height: 1.88 }

# • Is there an entry with the key :name ?
%{ name: a_name } = person
# %{height: 1.88, name: "Dave"}
a_name
# "Dave"


# • Are there entries for the keys :name and :height ?
%{ name: _, height: _ } = person
# %{height: 1.88, name: "Dave"}

# • Does the entry with key :name have the value "Dave" ?
%{ name: "Dave" } = person
# %{height: 1.88, name: "Dave"}


#if it doesnt have a value
%{ name: _, weight: _ } = person




#FILTERING
people = [
          %{ name: "Grumpy", height: 1.24 },
          %{ name: "Dave", height: 1.88 },
          %{ name: "sara", height: 1.34 },
          %{ name: "olie", height: 2.67 },
          %{ name: "bri", height: 4.6 }
         ]

IO.inspect(for person = %{ height: height } <- people, height > 1.5, do: person)






#enumerate through all
defmodule HotelRoom do

  def book(%{name: name, height: height})
    when height > 1.9 do
      IO.puts "Need extra long bed for #{name}"
  end

  def book(%{name: name, height: height})
  when height < 1.3 do
    IO.puts "Need low shower controls for #{name}"
  end

  def book(person) do
    IO.puts "Need regular bed for #{person.name}"
  end

end


people |> Enum.each(&HotelRoom.book/1)


#PATTERN MATCHING CANT BIND Keys
# You can’t bind a value to a key during pattern matching
%{ 2 => state } = %{ 1 => :ok, 2 => :error }
state
%{ item => :ok } = %{ 1 => :ok, 2 => :error }
