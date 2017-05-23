require './requires'

run Rack::URLMap.new(
  '/' => HomeController
)
