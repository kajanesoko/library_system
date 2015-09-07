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


ActiveRecord::Schema.define(version: 20150907125613) do

  create_table "borrow", primary_key: "borrow_id", force: true do |t|
    t.integer  "user_id",         null: false
    t.integer  "item_id",         null: false
    t.string   "book_type"
    t.boolean  "approval_status"
    t.text     "reason"

ActiveRecord::Schema.define(version: 20150907124116) do

  create_table "borrows", force: true do |t|
    t.string   "name"
    t.integer  "numberrrr"

    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue", primary_key: "issue_id", force: true do |t|
    t.integer  "user_id",                   null: false
    t.integer  "item_id",                   null: false
    t.date     "date_of_issue",             null: false
    t.date     "date_of_return",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",         limit: 45
  end

  add_index "issue", ["item_id"], name: "item_id", using: :btree
  add_index "issue", ["user_id"], name: "user_id", using: :btree

  create_table "item", primary_key: "item_id", force: true do |t|
    t.string   "item_name",                        null: false
    t.integer  "item_category_id",                 null: false
    t.string   "author"
    t.string   "publisher"
    t.integer  "year"
    t.string   "edition"
    t.string   "description"
    t.string   "serial"
    t.boolean  "void",             default: false, null: false
    t.string   "void_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",           default: ""
  end

  add_index "item", ["item_category_id"], name: "item_category_id", using: :btree

  create_table "item_category", primary_key: "item_category_id", force: true do |t|
    t.string   "name",            null: false
    t.string   "cat_description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", primary_key: "user_id", force: true do |t|
    t.string   "username",                 null: false
    t.string   "firstname",                null: false
    t.string   "lastname",                 null: false
    t.text     "password_hash",            null: false
    t.string   "user_role",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt",          limit: 45, null: false
  end

end
