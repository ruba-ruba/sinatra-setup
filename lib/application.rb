require 'sinatra/base'

class Application < Sinatra::Base
  set :views, File.expand_path('../../views', __FILE__)
end
