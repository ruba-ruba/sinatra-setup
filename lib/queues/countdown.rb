module MessageProcessors
  class Countdown
    include ::Logging

    def call(payload)
      (0..payload['count'].to_i).to_a.reverse.each do |i|
        logger.info "counting #{i}"
        sleep 0.1
      end
    end
  end
end