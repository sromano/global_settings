ActiveRecord::Schema.define do

  create_table "settings", force: true do |t|
    t.string "key",   null: false
    t.text   "value"
  end

  add_index "settings", ["key"], name: "index_settings_on_key", unique: true
end
