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

ActiveRecord::Schema.define(version: 2022_11_29_175916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabinets", force: :cascade do |t|
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "expiration_date"
    t.string "category"
    t.bigint "cabinet_id"
    t.bigint "refridgerator_id"
    t.bigint "freezer_id"
    t.bigint "miscellaneous_id"
    t.index ["cabinet_id"], name: "index_foods_on_cabinet_id"
    t.index ["freezer_id"], name: "index_foods_on_freezer_id"
    t.index ["miscellaneous_id"], name: "index_foods_on_miscellaneous_id"
    t.index ["refridgerator_id"], name: "index_foods_on_refridgerator_id"
  end

  create_table "freezers", force: :cascade do |t|
  end

  create_table "miscellaneous", force: :cascade do |t|
  end

  create_table "refridgerators", force: :cascade do |t|
  end

  add_foreign_key "foods", "cabinets"
  add_foreign_key "foods", "freezers"
  add_foreign_key "foods", "miscellaneous", column: "miscellaneous_id"
  add_foreign_key "foods", "refridgerators"
end
