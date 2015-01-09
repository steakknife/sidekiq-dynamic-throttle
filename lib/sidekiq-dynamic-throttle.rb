require 'celluloid'
require 'sidekiq/fetch'

require 'sidekiq-dynamic-throttle/version'
require 'sidekiq-dynamic-throttle/fetch'

module Sidekiq::DynamicThrottle
  def self.throttles
    @throttles ||= Hash.new { |hash, key| hash[key] = [] }
  end

  def self.register_throttle(queue, throttle)
    throttles['queue:' + queue.to_s] << throttle
  end
end
