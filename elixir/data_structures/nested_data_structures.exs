# Often we will have maps inside maps, or even keywords lists inside maps, and so forth. Elixir provides conveniences for manipulating nested data structures via the put_in/2, update_in/2 and other macros giving the same conveniences you would find in imperative languages while keeping the immutable properties of the language.

users = [
          john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
          mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
        ]

users[:john]

users[:john][:age]
users[:john].age

users[:john][:languages]


# It happens we can also use this same syntax for updating the value:
users = put_in users[:john].age, 31


# The update_in/2 macro is similar but allows us to pass a function that controls how the value changes. For example, let’s remove “Clojure” from Mary’s list of languages:

users = update_in users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end
