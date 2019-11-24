class CreateUsers < ActiveRecord::Migration[5.1]
  
  def up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :balance
    end
  end

end
