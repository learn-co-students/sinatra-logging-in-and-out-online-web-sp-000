ActiveRecord::Schema.define(version: 20160118225627) do

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password"
    t.decimal "balance"
  end

end