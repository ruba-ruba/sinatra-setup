class SignupProcessor
  def self.process(params)
    new(params).process
  end

  attr_reader :email, :password, :password_confirmation
  def initialize(params)
    @email = params['email']
    @password = params['password']
    @password_confirmation = params['password_confirmation']
  end

  def process
    user = User.new(email: email, password: password)
    return user unless params_valid?
    user.valid? && user.save
    user
  end

  private

  def params_valid?
    email &&
      password &&
      password_confirmation &&
      password == password_confirmation
  end
end
