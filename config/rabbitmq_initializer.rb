require 'json'
require 'yaml'

module RabbitMQ
  class Initializer
    def self.start
      initializer = new(YAML.load_file('./config/queues.yml'))
      # initializer.register_queues
      initializer.start_consumers
    end

    def initialize(queues)
      @queues = queues
    end

    def register_queues
      queues.each do |queue_name, _|
        channel.queue(queue_name)
      end
    end

    def start_consumers
      queues.each do |queue_name, options|
        RabbitMQ::Consumer.start(queue_name, options)
      end
    end

    private

    attr_reader :queues

    def channel
      @channel ||= begin
        conn = Bunny.new
        conn.start
        ch = conn.create_channel
        at_exit { conn.close }
        ch
      end
    end
  end
end