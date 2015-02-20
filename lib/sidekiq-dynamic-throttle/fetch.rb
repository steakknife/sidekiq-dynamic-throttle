require 'celluloid'
require 'sidekiq/fetch'
require 'sidekiq-dynamic-throttle/throttles'

module Sidekiq::DynamicThrottle
  class Fetch < Sidekiq::BasicFetch
    def retrieve_work
      work = Sidekiq.redis { |conn| conn.brpop(*unthrottled_queues) }
      UnitOfWork.new(*work) if work
    end

    private

    def unthrottled_queues
      queues_cmd.reject do |queue|
        Sidekiq::DynamicThrottle.throttles[queue].find(&:throttled?)
      end
    end
  end
end
