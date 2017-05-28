DEVELOPMENT_DB = 'development.db'.freeze

Sequel.connect("sqlite://db/#{DEVELOPMENT_DB}")
