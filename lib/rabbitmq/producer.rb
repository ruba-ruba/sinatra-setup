module RabbitMQ
  class Producer
    def call(queue_name, payload)
      x = channel.direct('internal')
      q = channel.queue(queue_name, exclusive: false)
      q.bind(x, :routing_key => queue_name)

      x.publish(payload.to_json, routing_key: queue_name)
    end

    private

    def channel
      @channel ||= begin
        conn = Bunny.new
        conn.start
        conn.create_channel
      end
    end
  end
end
