# PluralsightTweet

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pluralsight_tweet` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:pluralsight_tweet, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/pluralsight_tweet](https://hexdocs.pm/pluralsight_tweet).

mix new pluralsight_tweet --sup
cd pluralsight_tweet && mix



application that will read in a file of text, parse it  format it accordingly and then tweet it out and this will do all of this on a schedule

elixir uses erlang processes that are different from os processes
erlang processes are very light weight, they start with low memory footprint of approximatly 2k

its not uncommon to have 10's or 100's or 1000's of processes running simultaneously

we try to use hex , a module to send out the tweet and a module that handle the schedule

#PROJECT STRUCTURE
