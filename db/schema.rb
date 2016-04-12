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

ActiveRecord::Schema.define(version: 20160411160507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookstores", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "address",     null: false
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "url"
    t.string   "img_url"
    t.string   "description"
    t.boolean  "beverage"
    t.boolean  "food"
    t.integer  "user_id",     null: false
    t.string   "zip_code",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookstores", ["name", "address", "city"], name: "index_bookstores_on_name_and_address_and_city", unique: true, using: :btree

  create_table "downvotes", force: :cascade do |t|
    t.integer "review_id"
    t.integer "user_id"
  end

  add_index "downvotes", ["review_id"], name: "index_downvotes_on_review_id", using: :btree
  add_index "downvotes", ["user_id"], name: "index_downvotes_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",                             null: false
    t.integer  "bookstore_id",                        null: false
    t.integer  "overall_rating",                      null: false
    t.integer  "price_rating",                        null: false
    t.integer  "variety_rating",                      null: false
    t.integer  "customer_service_rating",             null: false
    t.integer  "beverage_rating"
    t.integer  "food_rating"
    t.integer  "atmosphere_rating"
    t.text     "body"
    t.integer  "count",                   default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "reviews", ["bookstore_id"], name: "index_reviews_on_bookstore_id", using: :btree
  add_index "reviews", ["user_id", "bookstore_id"], name: "index_reviews_on_user_id_and_bookstore_id", unique: true, using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "upvotes", force: :cascade do |t|
    t.integer "review_id"
    t.integer "user_id"
  end

  add_index "upvotes", ["review_id"], name: "index_upvotes_on_review_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password",                     null: false
    t.string   "user_name",                              null: false
    t.string   "avatar"
    t.boolean  "malicious",              default: false
    t.boolean  "admin",                  default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookstores", "users"
end
