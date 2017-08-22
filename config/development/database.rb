DB = Sequel.connect('sqlite://db/development.db')
DB.loggers << CommonLogger.new(Application.log_level, name: 'Sequel')