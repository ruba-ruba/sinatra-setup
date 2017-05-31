Dir["./config/#{ENV['RACK_ENV']}/*.rb"].each { |file| require file }

Sequel.connect("sqlite://db/#{DB}")
