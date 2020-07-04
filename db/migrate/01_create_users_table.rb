class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.decimal :balance
      t.timestamps
    end
  end

end


#create users table to inherit active record
#table has user username, password, balance, and timestamps
#To create table: 1. run rake db:create_migration NAME= create_users_table, 2. rename file, 3. create class/class method
#To add table to schema: run rake db:migrate or rake db:migrate SINATRA_ENV=test if there are issues
