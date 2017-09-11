require 'json'
require 'yaml'

module RabbitMQ
  class Initializer
    include Singleton

    attr_reader :queues, :connection

    def initialize(path = './config/queues.yml')
      @queues = YAML.load_file(path)
      @logger = CommonLogger.new(Logger::INFO, name: 'RabbitMQ')
      @connection = conn
    end

    def start_consumers
      queues.each do |queue_name, options|
        RabbitMQ::Consumer.start(queue_name, options)
      end
    end

    def conn
      @conn ||=
        with_retry do
          conn = Bunny.new(ENV['RABBITMQ_URI'], logger: @logger)
          at_exit { conn.close }
          conn.start
        end
    end

    private

    def with_retry(retry_count = 5, &block)
      begin
        yield
      rescue Bunny::TCPConnectionFailedForAllHosts => e
        raise e if retry_count.zero?
        sleep 1
        with_retry(retry_count -= 1, &block)
      end
    end
  end
end