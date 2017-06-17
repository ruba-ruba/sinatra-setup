class UserAuthentication
  include Interactor

  def call
    if user && user.password == Digest::SHA1.hexdigest(context['password'])
      context.user = user
    else
      context.fail!(message: 'Could not log in')
    end
  end

  private

  def user
    @user ||= User.first(email: context['email'])
  end
end
