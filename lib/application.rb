Bundler.require
require 'sinatra/base'
require 'rack-flash'
require 'pry'

class Application < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  set :logging, true

  enable :sessions
  set :session_secret, 'supersecret'

  FLASH_MESSAGE_TYPES = %i[error success notice].freeze

  use Rack::Flash, accessorize: FLASH_MESSAGE_TYPES

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = LoginManager

    manager.scope_defaults :default,
      strategies: [:password],
      action: '/login'
  end

  def warden
    env['warden']
  end
end

require './lib/deps'
