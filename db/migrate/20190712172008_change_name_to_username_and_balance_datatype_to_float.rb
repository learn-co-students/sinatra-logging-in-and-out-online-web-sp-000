class ChangeNameToUsernameAndBalanceDatatypeToFloat < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :username
    change_column :users, :balance, :float
  end
end
