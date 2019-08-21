class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :users
        add_column :users, :username, :string
        add_column :users, :password, :string
        add_column :users, :balance, :decimal
    end
end