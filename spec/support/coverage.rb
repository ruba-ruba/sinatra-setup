if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    add_group 'config', 'config'
    add_group 'models', 'lib/models'
    add_group 'processors', 'lib/processors'
    add_group 'web', 'lib/web'
  end
end
