# todo: move this to db:setup rake task
db = SQLite3::Database.new "development.db"

rows = db.execute <<-SQL
  CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY   AUTOINCREMENT,
    email varchar(255),
    password varchar(255)
  );
SQL

DB = Sequel.connect('sqlite://development.db')
