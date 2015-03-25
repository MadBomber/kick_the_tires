# KickTheTires

Provides some basic methods/assertions that are handy for exploring a new ruby library.

Sometimes when you hear about a new library/gem you just wat to kick the
kick_the_tires to see what it can do.  Sometimes you start with some REPL
example from the authors or some sample code or tests that the author has
provided.  This little gem allowed_push_host you to load up a few basic
asserts/refutes/shows to explore the library's objects and method results.
When you have finished kicking the tires you may want to take the library out
for a spin with some functional, application-line code and you don't want
any of the tire kicking out to STDOUT.

It would be a good idea to reuse someone's general purpose assertations library.
I did a quick look and didn't find any that were not tightly coupled with a
testing framework.  Its an API exploration tool to learn the methods and
objects introduced by a new gem that you have never seen before.

You would never buy a used car without first kicking the tires and taking it
for a spin.  Why would you start using a new gem without playing with it for
a while?

## Installation

Install it yourself as:

    $ gem install kick_the_tires

## Usage

```ruby
require 'kick_the_tires'
include KickTheTires

require 'some_new_gem_to_explore'

sngte = SomeNewGemToExplore.new

refute sngte.nil?
assert_equal SomeNewGemToExplore, sngte.class
assert sngte.return_true
show sngte

take_it_for_a_spin # disables all asserts/refutes/shows

assert sngte.nil? # does nothing but return

# some application-like code that uses the new gem
sngte.each do |s|
  # do something
end

give_the_keys_back  # enables the asserts/regutes/shows

assert sngte.nil? # active again, will display error stuff if object is not nil

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kick_the_tires/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
