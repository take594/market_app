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

ActiveRecord::Schema.define(version: 2025_07_29_040925) do

  create_table "interesteds", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_interesteds_on_item_id"
    t.index ["user_id"], name: "index_interesteds_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.integer "price"
    t.string "category"
    t.text "introduction"
    t.boolean "onSale"
    t.integer "interest"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "deliveryStatus"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.boolean "arrived"
    t.integer "rate"
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.text "introduction"
    t.integer "likes"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "interesteds", "items"
  add_foreign_key "interesteds", "users"
  add_foreign_key "items", "users"
  add_foreign_key "purchases", "items"
  add_foreign_key "purchases", "users"
end
