class ChangeColumnInUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t| 
      t.change :balance, :float
    end
  end
end


