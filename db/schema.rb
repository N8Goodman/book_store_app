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

ActiveRecord::Schema.define(version: 20160405184832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookstores", force: :cascade do |t|
    t.string  "name",        null: false
    t.string  "address",     null: false
    t.string  "city",        null: false
    t.string  "state",       null: false
    t.integer "zip_code",    null: false
    t.string  "url"
    t.string  "img_url"
    t.string  "description"
    t.boolean "beverage"
    t.boolean "food"
  end

  add_index "bookstores", ["name", "address", "city"], name: "index_bookstores_on_name_and_address_and_city", unique: true, using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id",                 null: false
    t.integer "bookstore_id",            null: false
    t.integer "overall_rating",          null: false
    t.integer "price_rating",            null: false
    t.integer "variety_rating",          null: false
    t.integer "customer_service_rating", null: false
    t.integer "beverage_rating"
    t.integer "food_rating"
    t.integer "atmosphere_rating"
    t.text    "body"
  end

  add_index "reviews", ["bookstore_id"], name: "index_reviews_on_bookstore_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

end
