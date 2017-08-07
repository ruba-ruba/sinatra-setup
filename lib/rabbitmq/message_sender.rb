class MessageSender
  def call(queue_name, payload)
    RabbitMQ::Producer.new.call(queue_name, payload)
  end
end
