require 'pry'
require 'require_all'
require_all 'lib'
require_all 'controllers'

run Rack::URLMap.new(
  '/' => HomeController
)
