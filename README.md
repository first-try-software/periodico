<center><img src="./assets/typewriter.png" alt="Typewriter"/></center>

# Periodico

[![Gem Version](https://badge.fury.io/rb/periodico.svg)](https://badge.fury.io/rb/periodico)
[![CI](https://github.com/first-try-software/periodico/actions/workflows/main.yml/badge.svg)](https://github.com/first-try-software/periodico/actions/workflows/main.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/b4a999863f92a8ce72a0/maintainability)](https://codeclimate.com/github/first-try-software/periodico/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/b4a999863f92a8ce72a0/test_coverage)](https://codeclimate.com/github/first-try-software/periodico/test_coverage)

Periodico is a lightweight pub/sub framework that leverages self-registration and dependency injection to communicate events to subscribers.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add periodico

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install periodico

## Usage

### Publish an event like so...

```ruby
publisher = Periodico.new
publisher.publish(message: :some_event, params: {})
```

### Subscribe to an event like so...

```ruby
class MySubscriber < Periodico::Subscriber do
  subscribes_to :some_event

  def receive
    # respond to event
  end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/first-try-software/periodico. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/first-try-software/periodico/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Periodico project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/first-try-software/periodico/blob/main/CODE_OF_CONDUCT.md).
