RSpec.describe Periodico do
  example "publishing an event notifies subscribers" do
    subscriber1 = Class.new(Periodico::Subscriber) do
      subscribes_to :some_event

      def initialize(observer:)
        @observer = observer
      end

      def receive
        @observer.report(:subscriber1)
      end
    end

    subscriber2 = Class.new(Periodico::Subscriber) do
      subscribes_to :some_event

      def initialize(observer:)
        @observer = observer
      end

      def receive
        @observer.report(:subscriber2)
      end
    end

    observer = instance_double('observer', report: true)
    publisher = Periodico.new(worker_pool_size: 0)

    publisher.publish(message: :some_event, params: { observer: observer })

    expect(observer).to have_received(:report).with(:subscriber1).once
    expect(observer).to have_received(:report).with(:subscriber2).once
  end
end
