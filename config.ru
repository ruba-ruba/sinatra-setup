Bundler.require

require './requires'

run Rack::URLMap.new(
  '/' => HomeController
)
