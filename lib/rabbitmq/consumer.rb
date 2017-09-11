require 'bunny'
require 'json'

module RabbitMQ
  class Consumer
    def self.start(queue_name, options)
      new(queue_name, options).start
    end

    def initialize(queue_name, options)
      @queue_name = queue_name
      @options = options
      @queue_factory = RabbitMQ::QueueFactory
    end

    def start
      options["concurrency"].to_i.times do
        queue.subscribe(block: false) do |delivery_info, properties, payload|
          puts "#{self.class.name} | queue id: #{queue.object_id}"
          queue_class = queue_factory.produce(queue_name)
          queue_class.call(JSON.parse(payload))
        end
      end
    end

    private

    attr_reader :queue_name, :queue_factory, :options

    def queue
      channel = create_channel
      x = channel.direct(queue_name)
      q = channel.queue(queue_name, exclusive: false)
      q.bind(x)
      q
    end

    def create_channel
      conn = RabbitMQ::Initializer.instance.connection
      conn.create_channel
    end
  end
end
