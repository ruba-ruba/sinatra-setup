module MessageProcessors
  class SignupNoticiation
    def call(payload)
      set_user(payload['user_id'].to_i)
      deliver
    end

    private

    attr_reader :user

    def deliver
      puts "sending email to #{user.email}"
      sleep 1
      puts "finished sending email"
    end

    def set_user(user_id)
      @user = User.find(user_id).first
    end
  end
end