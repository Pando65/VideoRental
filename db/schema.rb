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

ActiveRecord::Schema.define(version: 0) do

  create_table "directors", force: :cascade do |t|
    t.string "name", limit: 25, null: false
    t.string "nationality", limit: 50
  end

  create_table "members", force: :cascade do |t|
    t.string "first_ame",      limit: 15, null: false
    t.string "last_name",      limit: 15, null: false
    t.string "sex",        limit: 1,  null: false
    t.date   "date_of_birth"
    t.string "address",    limit: 50
    t.date   "date_joined"
  end

  create_table "rentalagreements", force: :cascade do |t|
    t.integer "member_id",       limit: 4, null: false
    t.integer "videoforrent_id", limit: 4, null: false
    t.date    "dateOut",                   null: false
    t.date    "dateReturn"
  end

  add_index "rentalagreements", ["member_id"], name: "member_id", using: :btree
  add_index "rentalagreements", ["videoforrent_id"], name: "videoforrent_id", using: :btree

  create_table "videoforrents", force: :cascade do |t|
    t.binary  "available", limit: 1, null: false
    t.integer "video_id",  limit: 4, null: false
  end

  add_index "videoforrents", ["video_id"], name: "video_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string  "title",       limit: 30,                         null: false
    t.string  "certificate", limit: 10
    t.string  "category",    limit: 10
    t.decimal "daily_rental",            precision: 8, scale: 2, null: false
    t.decimal "price",                  precision: 8, scale: 2, null: false
    t.integer "director_id", limit: 4
  end

  add_index "videos", ["director_id"], name: "director_id", using: :btree

  add_foreign_key "rentalagreements", "members", name: "rentalagreements_ibfk_1"
  add_foreign_key "rentalagreements", "videoforrents", name: "rentalagreements_ibfk_2"
  add_foreign_key "videoforrents", "videos", name: "videoforrents_ibfk_1"
  add_foreign_key "videos", "directors", name: "videos_ibfk_1"
end
