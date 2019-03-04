class CreateTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |u|
      u.string :username
      u.string :password
      u.decimal :balance,  precision: 30, :scale => 1
    end
  end
end
