module MessageProcessors
  class SignupNoticiation
    include ::Logging

    def call(payload)
      set_user(payload['user_id'].to_i)
      deliver
    end

    private

    attr_reader :user

    def deliver
      logger.info "sending email to #{user.email}"
      sleep 1
      logger.info "finished sending email"
    end

    def set_user(user_id)
      @user = User.find(user_id).first
    end
  end
end