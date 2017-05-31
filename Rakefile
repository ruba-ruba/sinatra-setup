require File.expand_path('../lib/application', __FILE__)

namespace :db do
  task :setup do
    desc 'create database & scheema'
    db = SQLite3::Database.new "db/#{DEVELOPMENT_DB}"

    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email varchar(255) not null unique,
        password varchar(255)
      );
    SQL
  end

  task :drop do
    desc 'drop development database'
    File.delete("db/#{DEVELOPMENT_DB}") if File.exist?("db/#{DEVELOPMENT_DB}")
  end

  task :reset do
    desc 'drop & re-create development database'
    task :drop
    task :setup
  end

  task :populate do
    desc 'populate development database'
    if User.find(email: 'user@com').nil?
      User.create(email: 'user@com', password: 'pass')
    end
  end
end
