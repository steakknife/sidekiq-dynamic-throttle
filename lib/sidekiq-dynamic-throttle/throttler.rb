module Sidekiq::DynamicThrottle::Throttler
  module ClassMethods
    def sidekiq_throttle_queue(*queues)
      Sidekiq::DynamicThrottle.register_throttle self, queues
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end
