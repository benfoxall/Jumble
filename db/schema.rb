# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100606183846) do

  create_table "causes", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", :force => true do |t|
    t.string   "path"
    t.boolean  "public"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.integer  "cause_id"
    t.integer  "user_id"
    t.string   "title"
    t.integer  "price"
    t.integer  "donation"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "postage",     :default => 0
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.boolean  "public",          :default => true
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "pay_key"
    t.string   "aasm_state", :default => "new"
    t.string   "email"
    t.string   "phone"
    t.text     "note"
    t.string   "name"
    t.string   "address"
    t.string   "address2"
    t.string   "town"
    t.string   "county"
    t.string   "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.string   "persistence_token"
    t.boolean  "verified"
    t.string   "verify_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "beta",              :default => false
    t.boolean  "admin",             :default => false
  end

end
