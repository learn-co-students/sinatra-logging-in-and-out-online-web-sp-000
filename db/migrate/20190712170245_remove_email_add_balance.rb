class RemoveEmailAddBalance < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :email, :balance
    change_column :users, :balance, :double
  end
end
