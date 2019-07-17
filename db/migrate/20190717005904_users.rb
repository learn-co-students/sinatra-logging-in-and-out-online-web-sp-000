class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, index: true, unique: true
      t.string :password
      t.decimal :balance, precision: 30, scale: 2
    end
  end
end
