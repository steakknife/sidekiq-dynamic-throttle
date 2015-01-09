require 'celluloid'
require 'sidekiq/fetch'

require 'sidekiq-dynamic-throttle/version'
require 'sidekiq-dynamic-throttle/fetch'
require 'sidekiq-dynamic-throttle/throttler'

module Sidekiq::DynamicThrottle
  def self.throttles
    @throttles ||= Hash.new { |hash, key| hash[key] = [] }
  end

  def self.register_throttle(throttle, *queues)
    queues.flatten!
    queues.each { |queue| throttles['queue:' + queue.to_s] << throttle }
  end
end
