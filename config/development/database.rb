DB = Sequel.connect('sqlite://db/development.db')
DB.loggers << Application.common_logger