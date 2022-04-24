RSpec.describe Periodico::Executor do
  subject(:executor) { described_class.new(pool_size: pool_size) }

  context "when the pool size is equal to 0" do
    let(:pool_size) { 0 }
    let(:observer) { instance_double("observer", report: true) }

    it "runs synchronously" do
      executor.execute { observer.report }

      expect(observer).to have_received(:report)
    end
  end

  context "when the pool size is greater than 0" do
    let(:pool_size) { 1 }
    let(:thread_pool) { instance_double(Concurrent::FixedThreadPool, post: true) }

    before do
      allow(Concurrent::FixedThreadPool).to receive(:new).and_return(thread_pool)
    end

    it "runs asynchronously" do
      worker = Proc.new {}

      expect(thread_pool).to receive(:post) { |&block| expect(block).to be(worker) }

      executor.execute(&worker)
    end
  end
end
