require 'pry'
require 'require_all'
require_all 'lib'
require_all 'controllers'

map('/') { run HomeController }
