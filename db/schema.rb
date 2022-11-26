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

ActiveRecord::Schema.define(version: 2022_11_26_104618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "masks", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 6, scale: 2
    t.bigint "pharmacy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pharmacy_id"], name: "index_masks_on_pharmacy_id"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.datetime "opening_at"
    t.datetime "close_at"
    t.bigint "pharmacy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pharmacy_id"], name: "index_opening_hours_on_pharmacy_id"
  end

  create_table "pharmacies", force: :cascade do |t|
    t.string "name"
    t.integer "cash_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "transaction_amount"
    t.datetime "transaction_date"
    t.bigint "user_id", null: false
    t.bigint "pharmacy_id", null: false
    t.bigint "mask_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pharmacy_name"
    t.string "mask_name"
    t.index ["mask_id"], name: "index_purchase_histories_on_mask_id"
    t.index ["pharmacy_id"], name: "index_purchase_histories_on_pharmacy_id"
    t.index ["user_id"], name: "index_purchase_histories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "cash_balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "masks", "pharmacies"
  add_foreign_key "opening_hours", "pharmacies"
  add_foreign_key "purchase_histories", "masks"
  add_foreign_key "purchase_histories", "pharmacies"
  add_foreign_key "purchase_histories", "users"
end
