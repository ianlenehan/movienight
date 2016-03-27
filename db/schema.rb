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

ActiveRecord::Schema.define(version: 20160327040858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text     "location"
    t.text     "imdb_id"
    t.date     "date"
    t.text     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "details"
    t.integer  "group_id"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.text     "name"
    t.text     "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.text     "rating_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "event_id"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text     "email"
    t.text     "name_first"
    t.text     "name_last"
    t.text     "password_digest"
    t.text     "image"
    t.boolean  "admin",           default: false
    t.integer  "group_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "group_admin"
    t.boolean  "group_member"
  end

end
