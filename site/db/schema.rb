# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_28_150634) do

  create_table "distilleries", force: :cascade do |t|
    t.string "name"
    t.string "country", null: false
    t.string "state"
    t.string "city"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "producer_id"
    t.index ["producer_id"], name: "index_distilleries_on_producer_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "whiskeys", force: :cascade do |t|
    t.string "brand"
    t.string "name"
    t.string "style"
    t.float "abv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "proof"
    t.float "rating"
    t.integer "distillery_id"
    t.index ["distillery_id"], name: "index_whiskeys_on_distillery_id"
  end

  add_foreign_key "distilleries", "producers"
  add_foreign_key "whiskeys", "distilleries"
end
