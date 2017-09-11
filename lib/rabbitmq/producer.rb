module RabbitMQ
  class Producer
    def call(queue_name, payload)
      x = channel.direct(queue_name)
      q = channel.queue(queue_name, exclusive: false)
      q.bind(x)
      x.publish(payload.to_json)
    end

    private

    def channel
      @channel ||= begin
        conn = RabbitMQ::Initializer.instance.connection
        conn.create_channel
      end
    end
  end
end
