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

ActiveRecord::Schema.define(version: 2021_01_02_165738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bachelorettes", force: :cascade do |t|
    t.string "name"
    t.integer "season_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "season_id"
    t.index ["season_id"], name: "index_bachelorettes_on_season_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.bigint "bachelorette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bachelorette_id"], name: "index_contestants_on_bachelorette_id"
  end

  create_table "outing_contestants", force: :cascade do |t|
    t.bigint "outing_id"
    t.bigint "contestant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_outing_contestants_on_contestant_id"
    t.index ["outing_id"], name: "index_outing_contestants_on_outing_id"
  end

  create_table "outings", force: :cascade do |t|
    t.string "description"
    t.string "location"
    t.date "date"
    t.integer "count_of_contestants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bachelorettes", "seasons"
  add_foreign_key "contestants", "bachelorettes"
  add_foreign_key "outing_contestants", "contestants"
  add_foreign_key "outing_contestants", "outings"
end
