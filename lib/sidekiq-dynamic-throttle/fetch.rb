require 'celluloid'
require 'sidekiq/fetch'

module Sidekiq::DynamicThrottle
  class Fetch < Sidekiq::BasicFetch
    def retrieve_work
      work = Sidekiq.redis { |conn| conn.brpop(*unthrottled_queues) }
      UnitOfWork.new(*work) if work
    end

    private

    def unthrottled_queues
      queues_cmd.reject do |queue|
        throttles = Sidekiq::DynamicThrottle.throttles[queue]
        next if throttles.blank?

        throttles.find { |throttle| throttle.throttled? }
      end
    end
  end
end
