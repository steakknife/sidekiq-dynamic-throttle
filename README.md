Sidekiq Dynamic Throttle
====================

Throttle fetching from queues dynamically.

## Compatibility

sidekiq-rate-limiter works by using a custom fetch class, the class responsible
for pulling work from the queue stored in redis. Consequently you'll want to be
careful about using other gems that use a same strategy, [sidekiq-priority](https://github.com/socialpandas/sidekiq-priority)
being one example.


## Installation

Add this line to your application's Gemfile:

    gem 'sidekiq-dynamic-throttle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sidekiq-dynamic-throttle

## Configuration

See [server.rb](lib/sidekiq-dynamic-throttle/server.rb) for an example of how to
configure sidekiq-rate-limiter. Alternatively you can add the following to your
initializer or what-have-you:

```ruby
require 'sidekiq-dynamic-throttle/server'
```

Or, if you prefer, amend your Gemfile like so:

    gem 'sidekiq-dynamic-throttle', :require => 'sidekiq-dynamic-throttle/server'

## Motivation

Sidekiq::Throttler is great for smaller quantities of jobs, but falls down a bit
for larger queues (see [issue #8](https://github.com/gevans/sidekiq-throttler/issues/8)). In addition, jobs that are
limited multiple times are counted as 'processed' each time, so the stats balloon quickly.

[Sidekiq::RateLimiter](https://github.com/enova/sidekiq-rate-limiter) works well when you've got consistent job processing limits, but can be a bit restrictive when throttling needs to be based on something that is more dynamic (i.e. API limits).

## Contributing

1. Fork
2. Commit
5. Pull Request

## License

MIT. See [LICENSE](LICENSE) for details.

## Credits

This was originally forked from [sidekiq-rate-limiter](https://github.com/enova/sidekiq-rate-limiter).