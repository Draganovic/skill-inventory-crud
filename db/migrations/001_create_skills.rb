require 'bundler'
Bundler.require

DB = [Sequel.sqlite("db/skill_inventory_test.sqlite3"), Sequel.sqlite("db/skill_inventory_development.sqlite3")]

DB.each do |db|
  db.create_table :skills do
    primary_key :id
    String :name
    String :status
  end
end
