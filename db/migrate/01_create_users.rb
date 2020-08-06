class CreateUsers < ActiveRecord::Migration[5.1] #Don't forget to specify which version
    def change
        create_table :users do |t|
            t.string :username 
            t.string :password
            t.decimal :balance              #decimal here was important!
        end
    end
end