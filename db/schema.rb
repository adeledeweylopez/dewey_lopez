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

ActiveRecord::Schema.define(version: 20140606150847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.integer  "level"
    t.integer  "parent_id"
    t.string   "token"
  end

  add_index "comments", ["page_id"], name: "index_comments_on_page_id", using: :btree
  add_index "comments", ["parent_id"], name: "index_comments_on_parent_id", using: :btree
  add_index "comments", ["token"], name: "index_comments_on_token", using: :btree

  create_table "pages", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "public",     default: false
    t.boolean  "sequence",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["title"], name: "index_pages_on_title", unique: true, using: :btree
  add_index "pages", ["user_id", "created_at"], name: "index_pages_on_user_id_and_created_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.string   "user_alias"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
