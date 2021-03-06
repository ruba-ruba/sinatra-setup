# frozen_string_literal: true

Warden::Manager.before_failure do |env, opts|
  # Sinatra is very sensitive to the request method
  # since authentication could fail on any type of method, we need
  # to set it for the failure app so it is routed to the correct block
  env['REQUEST_METHOD'] = 'GET'
end

Warden::Strategies.add(:password) do
  def valid?
    %w[email password].all? { |param| params[param] }
    # hadnle case when params aren't valid
  end

  def authenticate!
    result = UserAuthentication.call(params)
    result.fail? ? fail!(result.message) : success!(result.user)
  end
end

Warden::Manager.serialize_into_session { |user| user.id }
Warden::Manager.serialize_from_session { |id| User[id] }
