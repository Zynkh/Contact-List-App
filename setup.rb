require 'pry'
require 'active_record'
require 'pg'
require 'pp'
require_relative 'database_class'

puts "Establishing database connection..."
ActiveRecord::Base.establish_connection(
adapter: 'postgresql',
encoding: 'unicode',
pool: 5,
database: 'd78ok1gkabbb7d',
username: 'gtwapeurhxopde',
password: 'B0L4c6f9haSV_zCiwjtyjWZplj',
host: 'ec2-23-21-185-168.compute-1.amazonaws.com',
port: 5432,
min_message: 'error'
)
puts "CONNECTED"

ActiveRecord::Schema.define do
  if ActiveRecord::Base.connection.table_exists?(:contacts)
    puts "Retrieving database information..."
  else 
    puts "Setting up database..."
    create_table :contacts do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :phone, :string
      t.timestamps
    end
  end
end

  puts "DONE"