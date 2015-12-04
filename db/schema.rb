# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151203185903) do

  create_table "categories", force: :cascade do |t|
    t.integer  "clue"
    t.string   "theme"
    t.string   "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "clues", force: :cascade do |t|
    t.string   "category_id"
    t.boolean  "unrevealed"
    t.integer  "value"
    t.boolean  "right"
    t.boolean  "wrong"
    t.boolean  "no_resp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.text     "game_type"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: :cascade do |t|
    t.string   "game_id"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
