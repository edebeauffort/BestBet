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

ActiveRecord::Schema.define(version: 20170307114546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pool_id"
    t.integer  "selection_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["pool_id"], name: "index_bets_on_pool_id", using: :btree
    t.index ["selection_id"], name: "index_bets_on_selection_id", using: :btree
    t.index ["user_id"], name: "index_bets_on_user_id", using: :btree
  end

  create_table "chats", force: :cascade do |t|
    t.text     "content"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_chats_on_pool_id", using: :btree
  end

  create_table "invites", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pool_id"], name: "index_invites_on_pool_id", using: :btree
    t.index ["user_id"], name: "index_invites_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chat_id"
    t.index ["chat_id"], name: "index_messages_on_chat_id", using: :btree
    t.index ["pool_id"], name: "index_messages_on_pool_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "state"
    t.integer  "user_id"
    t.integer  "balance_cents", default: 0, null: false
    t.json     "payment"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "pools", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "stake"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "end_date"
    t.index ["user_id"], name: "index_pools_on_user_id", using: :btree
  end

  create_table "selections", force: :cascade do |t|
    t.string   "title"
    t.integer  "pool_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "winning_selection", default: false
    t.index ["pool_id"], name: "index_selections_on_pool_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "balance",                default: 0.0
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "username"
    t.integer  "balance_cents",          default: 0,   null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bets", "pools"
  add_foreign_key "bets", "selections"
  add_foreign_key "bets", "users"
  add_foreign_key "chats", "pools"
  add_foreign_key "invites", "pools"
  add_foreign_key "invites", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "pools"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "pools", "users"
  add_foreign_key "selections", "pools"
end
