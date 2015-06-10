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

ActiveRecord::Schema.define(version: 20150330202106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "firms", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watch_watches", force: :cascade do |t|
    t.integer  "watcher_id"
    t.string   "watcher_type"
    t.integer  "watchable_id"
    t.string   "watchable_type"
    t.datetime "last_viewed_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "watch_watches", ["watchable_type", "watchable_id"], name: "index_watch_watches_on_watchable_type_and_watchable_id", using: :btree
  add_index "watch_watches", ["watcher_id", "watcher_type", "watchable_id", "watchable_type"], name: "uniq_watches", unique: true, using: :btree
  add_index "watch_watches", ["watcher_type", "watcher_id"], name: "index_watch_watches_on_watcher_type_and_watcher_id", using: :btree

end
