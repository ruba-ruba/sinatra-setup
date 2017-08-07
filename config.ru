require File.expand_path('../lib/application', __FILE__)

$VERBOSE = nil

RabbitMQ::Initializer.start

run Rack::URLMap.new(
  '/' => LoginManager,
  '/home' => HomeApp
)
