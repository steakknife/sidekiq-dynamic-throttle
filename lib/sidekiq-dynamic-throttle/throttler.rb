module Sidekiq::DynamicThrottle::Throttler
  module ClassMethods
    def sidekiq_throttle(queue, throttler = nil, *opts)
      throttler ||= self
      Sidekiq::DynamicThrottle.register_throttle throttler, queue
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
