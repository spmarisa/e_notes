# what role it serves, how we can leverage it in our applications

###################################################################################################################################
# Introduction
# So what is GenStage? From the official documentation, it is a “specification and computational flow for Elixir”

# What it means is that GenStage provides a way for us to define a pipeline of work to be carried out by independent steps (or stages) in a separate processes; if you’ve worked with pipelines before then some of these concepts should be familiar.

# To better understand how this works, let’s visualize a simple producer-consumer flow:

# [A] -> [B] -> [C]

# In this example we have three stages: A a producer, B a producer-consumer, and C a consumer. A produces a value which is consumed by B, B performs some work and returns a new value which is received by our consumer C; the role of our stage is important

# While our example is 1-to-1 producer-to-consumer it’s possible to both have multiple producers and multiple consumers at any given stage.

# To better illustrate these concepts we’ll be constructing a pipeline with GenStage but first let’s explore the roles that GenStage relies upon a bit further.

###################################################################################################################################
# Consumers and Producers

    # :producer — A source. Producers wait for demand from consumers and respond with the requested events.

    # :producer_consumer — Both a source and a sink. Producer-consumers can respond to demand from other consumers as well as request events from producers.

    # :consumer — A sink. A consumer requests and receives data from producers.

    # Notice that our producers wait for demand? With GenStage our consumers send demand upstream and process the data from our producer. This facilitates a mechanism known as back-pressure. Back-pressure puts the onus on the producer to not over-pressure when consumers are busy.

###################################################################################################################################
# Getting Started
# we’ll be constructing a GenStage application that emits numbers, sorts out the even numbers, and finally prints them.

# For our application we’ll use all three GenStage roles. Our producer will be responsible for counting and emitting numbers. We’ll use a producer-consumer to filter out only the even numbers and later respond to demand from downstream. Last we’ll build a consumer to display the remaining numbers for us.

# We’ll begin by generating a project with a supervision tree:


mix new genstage_example --sup

cd genstage_example

defp deps do
   [
     {:gen_stage, "~> 0.7"},
   ]
 end

mix do deps.get, compile
##############################################################################################################################
# Producer
# The first step of our GenStage application is creating our producer. As we discussed before, we want to create a producer that emits a constant stream of numbers. Let’s create our producer file:

mkdir lib/genstage_example
touch lib/genstage_example/producer.ex

# Now we can add the code:

defmodule GenstageExample.Producer do
  alias Experimental.GenStage

  use GenStage

  def start_link(initial \\ 0) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(counter), do: {:producer, counter}

  def handle_demand(demand, state) do
    events = Enum.to_list(state..state + demand - 1)
    {:noreply, events, (state + demand)}
  end
end


##############################################################################################################################
# Producer Consumer
# Now that we have a number-generating producer, let’s move on to our producer-consumer. We’ll want to request numbers from our producer, filter out the odd one, and respond to demand.

touch lib/genstage_example/producer_consumer.ex

# Let’s update our file to look like the example code:

defmodule GenstageExample.ProducerConsumer  do
  alias Experimental.GenStage
  use GenStage

  require Integer

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [GenstageExample.Producer]}
  end

  def handle_events(events, _from, state) do
    numbers =
      events
      |> Enum.filter(&Integer.is_even/1)

    {:noreply, numbers, state}
  end
end

# You may have noticed with our producer-consumer we’ve introduced a new option in init/1 and a new function: handle_events/3. With the subscribe_to option, we instruct GenStage to put us into communication with a specific producer.

# The handle_events/3 method is our workhorse, where we receive our incoming events, process them, and return our transformed set. As we’ll see consumers are implemented in much the same way, but the important difference is what our handle_events/3 method returns and how it’s used. When we label our process a producer_consumer, the second argument of our tuple — numbers in our case — is used to meet the demand of consumers downstream. In consumers this value is discarded.


##############################################################################################################################
# Consumer
# Last but not least we have our consumer. Let’s get started:

touch lib/genstage_example/consumer.ex

# Since consumers and producer-consumers are so similar our code won’t look much different:

defmodule GenstageExample.Consumer do
  alias Experimental.GenStage
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    {:consumer, state, subscribe_to: [GenstageExample.ProducerConsumer]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.inspect {self(), event, state}
    end

    # As a consumer we never emit events
    {:noreply, [], state}
  end
end

# As we covered in the previous section, our consumer does not emit events, so the second value in our tuple will be discarded.


##############################################################################################################################
# Putting It All Together
# Now that we have our producer, producer-consumer, and consumer built, we’re ready to wire everything together.

# Let’s start by opening lib/genstage_example.ex and adding our new processes to the supervisor tree:

def start(_type, _args) do
  import Supervisor.Spec, warn: false

  children = [
    worker(GenstageExample.Producer, [0]),
    worker(GenstageExample.ProducerConsumer, []),
    worker(GenstageExample.Consumer, []),
  ]

  opts = [strategy: :one_for_one, name: GenstageExample.Supervisor]
  Supervisor.start_link(children, opts)
end

# If things are all correct, we can run our project and we should see everything working:

mix run --no-halt
{#PID<0.109.0>, 2, :state_doesnt_matter}
{#PID<0.109.0>, 4, :state_doesnt_matter}
{#PID<0.109.0>, 6, :state_doesnt_matter}
...
{#PID<0.109.0>, 229062, :state_doesnt_matter}
{#PID<0.109.0>, 229064, :state_doesnt_matter}
{#PID<0.109.0>, 229066, :state_doesnt_matter}

# We did it! As we expected our application only omits even numbers and it does so quickly.

At this point we have a working pipeline. There is a producer emitting numbers, a producer-consumer discarding odd numbers, and a consumer displaying all of this and continuing the flow.




##############################################################################################################################
# Multiple Producers or Consumers

# We mentioned in the introduction that it was possible to have more than one producer or consumer. Let’s take a look at just that.

# If we examine the IO.inspect/1 output from our example we see that every event is handled by a single PID. Let’s make some adjustments for multiple workers by modifying lib/genstage_example.ex:

children = [
  worker(GenstageExample.Producer, [0]),
  worker(GenstageExample.ProducerConsumer, []),
  worker(GenstageExample.Consumer, [], id: 1),
  worker(GenstageExample.Consumer, [], id: 2),
]

# Now that we’ve configured two consumers, let’s see what we get if we run our application now:

mix run --no-halt
{#PID<0.120.0>, 2, :state_doesnt_matter}
{#PID<0.121.0>, 4, :state_doesnt_matter}
{#PID<0.120.0>, 6, :state_doesnt_matter}
{#PID<0.120.0>, 8, :state_doesnt_matter}
...
{#PID<0.120.0>, 86478, :state_doesnt_matter}
{#PID<0.121.0>, 87338, :state_doesnt_matter}
{#PID<0.120.0>, 86480, :state_doesnt_matter}
{#PID<0.120.0>, 86482, :state_doesnt_matter}

# As you can see we now have multiple PIDs, simply by adding a line of code and giving our consumers IDs.


##############################################################################################################################
# Use Cases
# Now that we’ve covered GenStage and built our first example application, what are some of the real use cases for GenStage?
#
#     Data Transformation Pipeline — Producers don’t have to be simple number generators. We could produce events from a database or even another source like Apache’s Kafka. With a combination of producer-consumers and consumers, we could process, sort, catalog, and store metrics as they become available.
#
#     Work Queue — Since events can be anything, we could produce works of unit to be completed by a series of consumers.
#
#     Event Processing — Similar to a data pipeline, we could receive, process, sort, and take action on events emitted in real time from our sources.
#
# These are just a few of the possibilities for GenStage.


##############################################################################################################################
