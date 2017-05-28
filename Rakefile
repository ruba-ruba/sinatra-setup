require File.expand_path('../lib/application', __FILE__)

namespace :db do
  desc 'create database & scheema'
  task :setup do
    puts 'setting up database'
    db = SQLite3::Database.new "development.db"

    rows = db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY   AUTOINCREMENT,
        email varchar(255),
        password varchar(255)
      );
    SQL
  end
end