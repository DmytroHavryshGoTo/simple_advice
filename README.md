# SimpleAdvice [![Build Status](https://app.travis-ci.com/DmytroHavryshGoTo/simple_advice.svg?branch=main)](https://app.travis-ci.com/DmytroHavryshGoTo/simple_advice)

Implementation of [Advice Slip JSON API](https://api.adviceslip.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_advice'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install simple_advice

## Usage

Everthing is as simple as it could be.

### Get random advice
```ruby
rnd = SimpleAdvice.random # => #<SimpleAdvice::Advice>

rnd.id # => 77
rnd.advice # => "Mercy is the better part of justice."
```

### Find advice by id

```ruby
SimpleAdvice.find(advice_id: 77) # => #<SimpleAdvice::Advice>
```

### Find advice by text

```ruby
result = SimpleAdvice.find_by(query: "nice") # => #<SimpleAdvice::Collection> 

result.data # => [#<SimpleAdvice::Advice>]

result.total # => 1
```

## Config

SimpleAdvice uses Faraday to interact via HTTP, you can provide any HTTP adapter that Faraday supports(if you are using Rails put the following code into `initializers/simple_advice.rb`):

```ruby
SimpleAdvice::Config.http_adapter = :test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DmytroHavryshGoTo/simple_advice.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
