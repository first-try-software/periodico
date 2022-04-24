class Periodico
  class Executor
    attr_reader :pool_size

    def initialize(pool_size:)
      @pool_size = pool_size.to_i
    end

    def execute(&block)
      sync? ? block.call : worker_pool.post(&block)
    end

    private

    def worker_pool
      @worker_pool ||= Concurrent::FixedThreadPool.new(pool_size)
    end

    def sync?
      pool_size == 0
    end
  end
end
