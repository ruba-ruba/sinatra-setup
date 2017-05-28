require 'sinatra/base'
require 'rack-flash'
require 'pry'

class Application < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  set :logging, true

  enable :sessions
  set :session_secret, "supersecret"

  def warden
    env['warden']
  end

  use Rack::Flash, accessorize: [:error, :success]

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = LoginManager

    manager.scope_defaults :default,
      strategies: [:password],
      action: '/login'
  end
end