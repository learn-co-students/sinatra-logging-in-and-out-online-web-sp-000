class ChangeToFloat < ActiveRecord::Migration[4.2]
    def change
      change_table :users do |t|
        t.remove :balance
        t.float :balance
      end
    end
end