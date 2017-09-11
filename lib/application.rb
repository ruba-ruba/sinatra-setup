# frozen_string_literal: true

Bundler.require
require 'sinatra/base'
require 'rack-flash'
require 'pry'
require_relative 'common_logger'

ENV['RACK_ENV'] ||= 'development'

# main app class. Defines all settings & configuration.
class Application < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)

  def self.common_logger
    @_logger ||= CommonLogger.new(log_level, name: 'APP')
  end

  def self.log_level
    case ENV['RACK_ENV']
    when 'development' then Logger::DEBUG
    when 'test' then Logger::INFO
    end
  end

  configure do
    set :logging, nil
    set :logger, common_logger
  end

  enable :sessions
  set :session_secret, 'supersecret'

  FLASH_MESSAGE_TYPES = %i[error success notice].freeze

  use Rack::Flash, accessorize: FLASH_MESSAGE_TYPES

  use Warden::Manager do |manager|
    manager.default_strategies :password
    manager.failure_app = LoginManager

    manager.scope_defaults(
      :default,
      strategies: [:password],
      action: '/login'
    )
  end

  def warden
    env['warden']
  end
end

require './lib/deps'

# TODO: this should be handled vis spec_helper
unless ENV['RACK_ENV'] == 'test'
  RabbitMQ::Initializer.instance.start_consumers
end
