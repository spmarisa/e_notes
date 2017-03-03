# Structs are special maps with a defined set of keys and default values. A struct must be defined within a module, which it takes its name from. It is common for a struct to be the only thing defined within a module.

# To define a struct we use defstruct along with a keyword list of fields and default values:

defmodule Example.User do
  defstruct name: "Sean", roles: []
end

%Example.User{}
%Example.User{name: "Steve"}
%Example.User{name: "Steve", roles: [:admin, :owner]}

# We can update our struct just like we would a map:
steve = %Example.User{name: "Steve", roles: [:admin, :owner]}
sean = %{steve | name: "Sean"}

# Most importantly, you can match structs against maps:
%{name: "Sean"} = sean
# %Example.User{name: "Sean", roles: [:admin, :owner]}



#GET A VALUE FROM A STRUCT
defmodule User do
  defstruct email: nil
end

# dot syntax
"c@c.com" = %User{email: "c@c.com"}.email

# Underlying implementation is a map
# So Map methods work
"c@c.com" = Map.get(%User{email: "c@c.com"}, :email)

# Pattern match to get a value
%{ email: email }   = %User{email: "c@c.com"}
%User{email: email} = %User{email: "c@c.com"}

# Access protocol not available by default
%User{email: "c@c.com"}[:email]
#** (UndefinedFunctionError) undefined function User.fetch/2 (User does not implement the Access behaviour)
#             User.fetch(%User{email: "c@c.com"}, :email)
#    (elixir) lib/access.ex:118: Access.fetch/2
#    (elixir) lib/access.ex:149: Access.get/3


# Enumerable protocol not available by default
Enum.filter( %User{email: "c@c.com"}, fn({key, _}) -> key == :email  end)
#** (Protocol.UndefinedError) protocol Enumerable not implemented for %User{email: "c@c.com"}
#    (elixir) lib/enum.ex:1: Enumerable.impl_for!/1
#    (elixir) lib/enum.ex:116: Enumerable.reduce/3
#    (elixir) lib/enum.ex:1477: Enum.reduce/3
#    (elixir) lib/enum.ex:742: Enum.filter/2






#UPDATE A STRUCT FIELD
defmodule User do
  defstruct email: nil
end

%User{email: "c@c.com"} = struct(%User{}, email: "c@c.com")

# Structs are based on maps
# so map update methods and syntax are valid
%User{email: "a@a.co"} = %{ %User{} | email: "a@a.co" }

%User{email: "b@b.com"} = Map.put(%User{}, :email, "b@b.com")
