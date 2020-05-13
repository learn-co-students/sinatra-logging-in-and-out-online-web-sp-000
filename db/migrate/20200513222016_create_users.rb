class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |c|
      c.string :username
      c.string :password
      c.float :balance
    end
  end
end
