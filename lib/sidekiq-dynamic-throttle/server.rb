require 'sidekiq-dynamic-throttle/version'
require 'sidekiq-dynamic-throttle/fetch'

Sidekiq.configure_server do |config|
  Sidekiq.options[:fetch] = Sidekiq::DynamicThrottle::Fetch
end
