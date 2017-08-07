require 'singleton'
require 'yaml'

module RabbitMQ
  class QueueFactory
    include ::Singleton

    def self.produce(queue_name)
      instance.produce(queue_name)
    end

    def produce(queue_name)
      Object.const_get(queues[queue_name]['class_name']).new
    end

    private

    def queues
      @queues ||= YAML.load_file('./config/queues.yml')
    end
  end
end
