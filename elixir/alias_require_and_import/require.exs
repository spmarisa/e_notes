# Elixir provides macros as a mechanism for meta-programming (writing code that generates code).

# Macros are chunks of code that are executed and expanded at compilation time. This means, in order to use a macro, we need to guarantee its module and implementation are available during compilation. This is done with the require directive:

Integer.is_odd(3)

require Integer

Integer.is_odd(3)

# In Elixir, Integer.is_odd/1 is defined as a macro so that it can be used as a guard. This means that, in order to invoke Integer.is_odd/1, we need to first require the Integer module.

# In general a module does not need to be required before usage, except if we want to use the macros available in that module. An attempt to call a macro that was not loaded will raise an error. Note that like the alias directive, require is also lexically scoped. We will talk more about macros in a later chapter.
