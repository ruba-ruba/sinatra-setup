DB = Sequel.sqlite

DB.execute File.read('db/schema.sql')
