class Periodico
  class Subscriber
    extend Manufacturable::Item

    def self.subscribes_to(...)
      corresponds_to(...)
    end

    def receive; end
  end
end
