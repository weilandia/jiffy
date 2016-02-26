ActiveRecord::Schema.define(version: 20160226013212) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "jif_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["jif_id"], name: "index_favorites_on_jif_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "jifs", force: :cascade do |t|
    t.string   "jif_path"
    t.string   "static_path"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "jifs", ["category_id"], name: "index_jifs_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "favorites", "jifs"
  add_foreign_key "favorites", "users"
  add_foreign_key "jifs", "categories"
end
