class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :balance
    end
  end
 
  def down
    drop_table :dogs
  end

  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :balance
    end
  end

end
