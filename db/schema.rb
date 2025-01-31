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

ActiveRecord::Schema[7.0].define(version: 2023_08_03_183932) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.bigint "product_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.bigint "user_id", null: false
    t.index ["product_item_id"], name: "index_payments_on_product_item_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "product_item_dates", force: :cascade do |t|
    t.date "date"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["customer_id"], name: "index_product_item_dates_on_customer_id"
    t.index ["date", "customer_id"], name: "index_product_item_dates_on_date_and_customer_id", unique: true
    t.index ["date"], name: "index_product_item_dates_on_date"
    t.index ["user_id"], name: "index_product_item_dates_on_user_id"
  end

  create_table "product_items", force: :cascade do |t|
    t.bigint "product_item_date_id", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_status", null: false
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "store_id", default: 1, null: false
    t.index ["product_id"], name: "index_product_items_on_product_id"
    t.index ["product_item_date_id"], name: "index_product_items_on_product_item_date_id"
    t.index ["store_id"], name: "index_product_items_on_store_id"
    t.index ["user_id"], name: "index_product_items_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false
    t.string "code"
    t.integer "quantity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.decimal "unit_price", precision: 10, scale: 2, null: false
    t.bigint "store_id"
    t.index ["store_id"], name: "index_products_on_store_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "search_entries", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "searchable_type", null: false
    t.bigint "searchable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_search_entries_on_searchable"
  end

  create_table "store_products", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_store_products_on_product_id"
    t.index ["store_id"], name: "index_store_products_on_store_id"
  end

  create_table "store_staffs", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["store_id"], name: "index_store_staffs_on_store_id"
    t.index ["user_id"], name: "index_store_staffs_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "payments", "product_items"
  add_foreign_key "payments", "users"
  add_foreign_key "product_item_dates", "customers"
  add_foreign_key "product_item_dates", "users"
  add_foreign_key "product_items", "product_item_dates"
  add_foreign_key "product_items", "products"
  add_foreign_key "product_items", "stores"
  add_foreign_key "product_items", "users"
  add_foreign_key "products", "users"
  add_foreign_key "store_products", "products"
  add_foreign_key "store_products", "stores"
  add_foreign_key "store_staffs", "stores"
  add_foreign_key "store_staffs", "users"
  add_foreign_key "stores", "users"
end
