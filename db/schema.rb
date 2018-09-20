# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_09_163625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "funeral_homes", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funerals", force: :cascade do |t|
    t.string "disposition"
    t.text "disposition_expand"
    t.string "officiant"
    t.text "eulogist_expand"
    t.string "financial_plan"
    t.text "financial_plan_expand"
    t.string "service_type"
    t.text "service_type_expand"
    t.bigint "religion_id"
    t.text "religion_expand"
    t.bigint "funeral_home_id"
    t.text "funeral_home_expand"
    t.text "general_expand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funeral_home_id"], name: "index_funerals_on_funeral_home_id"
    t.index ["religion_id"], name: "index_funerals_on_religion_id"
  end

  create_table "religions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_funerals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "funeral_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funeral_id"], name: "index_user_funerals_on_funeral_id"
    t.index ["user_id"], name: "index_user_funerals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "users"
  add_foreign_key "funerals", "funeral_homes"
  add_foreign_key "funerals", "religions"
  add_foreign_key "user_funerals", "funerals"
  add_foreign_key "user_funerals", "users"
end
