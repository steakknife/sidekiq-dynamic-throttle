module Sidekiq::DynamicThrottle
  def self.throttles
    @throttles ||= Hash.new { |hash, key| hash[key] = [] }
  end

  def self.register_throttle(throttle, *queues)
    queues.flatten.each { |queue| throttles["queue:#{queue}"] << throttle }
  end
end
