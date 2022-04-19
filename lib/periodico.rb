require "manufacturable"
require "concurrent"
require_relative "periodico/version"
require_relative "periodico/subscriber"
require_relative "periodico/executor"

class Periodico
  DEFAULT_WORKER_POOL_SIZE = 5

  attr_reader :worker_pool_size

  def initialize(worker_pool_size: DEFAULT_WORKER_POOL_SIZE)
    @worker_pool_size = worker_pool_size
  end

  def publish(message:, params:)
    executor.execute do
      Manufacturable.build_all(Subscriber, message, **params).each(&:receive)
    end
  end

  private

  def executor
    @executor ||= Executor.new(pool_size: worker_pool_size)
  end
end
