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

ActiveRecord::Schema.define(version: 2022_11_29_222718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabinets", force: :cascade do |t|
    t.bigint "food_id"
    t.index ["food_id"], name: "index_cabinets_on_food_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "expiration_date"
    t.string "category"
  end

  create_table "freezers", force: :cascade do |t|
    t.bigint "food_id"
    t.index ["food_id"], name: "index_freezers_on_food_id"
  end

  create_table "others", force: :cascade do |t|
    t.bigint "food_id"
    t.index ["food_id"], name: "index_others_on_food_id"
  end

  create_table "refridgerators", force: :cascade do |t|
    t.bigint "food_id"
    t.index ["food_id"], name: "index_refridgerators_on_food_id"
  end

  add_foreign_key "cabinets", "foods"
  add_foreign_key "freezers", "foods"
  add_foreign_key "others", "foods"
  add_foreign_key "refridgerators", "foods"
end
