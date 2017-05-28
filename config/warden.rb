Warden::Manager.before_failure do |env,opts|
  # Sinatra is very sensitive to the request method
  # since authentication could fail on any type of method, we need
  # to set it for the failure app so it is routed to the correct block
  env['REQUEST_METHOD'] = 'GET'
end

Warden::Strategies.add(:password) do
  def valid?
    params['email'] || params['password']
  end

  def authenticate!
    u = User.authenticate(params['email'], params['password'])
    result = u.nil? ? fail!('Could not log in') : success!(u)
    puts "auth --- #{result}"
  end
end

Warden::Manager.serialize_into_session { |user| user.id }
Warden::Manager.serialize_from_session { |id| User[id] }
