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

ActiveRecord::Schema.define(version: 2019_04_17_084827) do

  create_table "bank_details", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_holder_name"
    t.string "bank_name"
    t.string "account_name"
    t.index ["user_id"], name: "index_bank_details_on_user_id"
  end

  create_table "card_details", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "card_holder_name"
    t.string "card_provider"
    t.string "card_type"
    t.index ["user_id"], name: "index_card_details_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "company_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "base"
    t.datetime "timestamp"
    t.date "date"
    t.float "rates_GBP"
    t.float "rates_USD"
    t.float "rates_EUR"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "future_payments", force: :cascade do |t|
    t.integer "subscription_id"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscription_id"], name: "index_future_payments_on_subscription_id"
  end

  create_table "past_payments", force: :cascade do |t|
    t.integer "subscription_id"
    t.date "date"
    t.integer "user_id"
    t.string "product"
    t.integer "billing_value"
    t.integer "currency_id"
    t.string "payment_method_type"
    t.integer "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_past_payments_on_currency_id"
    t.index ["subscription_id"], name: "index_past_payments_on_subscription_id"
    t.index ["user_id"], name: "index_past_payments_on_user_id"
  end

  create_table "paypal_details", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_email"
    t.index ["user_id"], name: "index_paypal_details_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_id"
    t.string "product"
    t.integer "billing_value"
    t.string "billing_frequency"
    t.integer "currency_id"
    t.string "contract_type"
    t.date "contract_start"
    t.date "contract_end"
    t.string "payment_method_type"
    t.integer "payment_method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_subscriptions_on_company_id"
    t.index ["currency_id"], name: "index_subscriptions_on_currency_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
