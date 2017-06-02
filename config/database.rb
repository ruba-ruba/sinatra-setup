Dir["./config/#{ENV['RACK_ENV']}/*.rb"].each { |file| require file }
