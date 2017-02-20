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
