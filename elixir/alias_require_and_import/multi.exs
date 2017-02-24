# From Elixir v1.2, it is possible to alias, import or require multiple modules at once. This is particularly useful once we start nesting modules, which is very common when building Elixir applications. For example, imagine you have an application where all modules are nested under MyApp, you can alias the modules MyApp.Foo, MyApp.Bar and MyApp.Baz at once as follows:

alias MyApp.{Foo, Bar, Baz}

# With this we have finished our tour of Elixir modules. The last topic to cover is module attributes.
