class UpdateColumnBalance < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :decimal, :balance
  end
end
