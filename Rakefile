require 'pry'
require File.expand_path('../lib/application', __FILE__)

namespace :db do
  namespace :schema do
    task :load do
      desc 'load schema'
      DB.execute File.read('db/schema.sql')
    end
  end

  task :drop do
    desc 'drop development database'
    File.delete("db/development.db") if File.exist?("db/development.db")
  end

  task :create do
    desc 'create development database'
    unless File.exist?("db/development.db")
      File.open("db/development.db", "w") {}
    end
  end

  task :reset do
    desc 'drop & re-create development database'
    task :drop
    task :create
    Rake::Task['db:schema:load'].invoke
  end

  task :populate do
    desc 'populate development database'
    if User.find(email: 'user@com').nil?
      User.create(email: 'user@com', password: 'pass')
    end
  end
end
