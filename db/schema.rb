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

ActiveRecord::Schema.define(version: 20150826135008) do

  create_table "books", primary_key: "item_id", force: true do |t|
    t.string   "book_authour",        null: false
    t.integer  "year_of_publication", null: false
    t.text     "version",             null: false
    t.string   "publisher",           null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cd_dvds", primary_key: "item_id", force: true do |t|
    t.string   "cd_publisher", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", primary_key: "issue_id", force: true do |t|
    t.integer  "user_id",        null: false
    t.integer  "item_id",        null: false
    t.date     "date_of_issue",  null: false
    t.date     "date_of_return", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item", primary_key: "item_id", force: true do |t|
    t.string   "item_name",     null: false
    t.string   "item_category", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", primary_key: "item_id", force: true do |t|
    t.string   "publisher",  null: false
    t.string   "author",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laptops", force: true do |t|
    t.string   "name"
    t.string   "serial_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user", primary_key: "user_id", force: true do |t|
    t.string   "username",      null: false
    t.string   "firstname",     null: false
    t.string   "lastname",      null: false
    t.text     "password_hash", null: false
    t.string   "user_role",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
