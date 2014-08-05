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

ActiveRecord::Schema.define(version: 20140803211223) do

  create_table "friendship_requests", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "target_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendship_requests", ["target_id"], name: "index_friendship_requests_on_target_id"
  add_index "friendship_requests", ["user_id", "target_id"], name: "index_friendship_requests_on_user_id_and_target_id", unique: true
  add_index "friendship_requests", ["user_id"], name: "index_friendship_requests_on_user_id"

  create_table "friendships", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "author_id"
    t.text     "content"
    t.integer  "postable_id"
    t.string   "postable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer "user_id"
  end

  create_table "user_emails", force: true do |t|
    t.integer  "user_id",                    null: false
    t.string   "email",                      null: false
    t.boolean  "verified",   default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_emails", ["email"], name: "index_user_emails_on_email", unique: true
  add_index "user_emails", ["user_id"], name: "index_user_emails_on_user_id"

  create_table "user_sessions", force: true do |t|
    t.integer  "user_id",     null: false
    t.string   "key",         null: false
    t.string   "ip",          null: false
    t.string   "user_agent"
    t.datetime "accessed_at", null: false
    t.datetime "revoked_at"
  end

  add_index "user_sessions", ["key"], name: "index_user_sessions_on_key", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_image_file_name"
    t.string   "profile_image_content_type"
    t.integer  "profile_image_file_size"
    t.datetime "profile_image_updated_at"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
  end

end
