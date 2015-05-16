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

ActiveRecord::Schema.define(version: 20150310181607) do

  create_table "commenters", id: false, force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commenters", ["user_id", "post_id"], name: "index_commenters_on_user_id_and_post_id"

  create_table "details", id: false, force: :cascade do |t|
    t.integer  "group_id"
    t.string   "details",    limit: 50
    t.integer  "privacy"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "details", ["group_id"], name: "index_details_on_group_id"

  create_table "friendships", id: false, force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.integer  "user_id"
    t.boolean  "secret"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id"

  create_table "likers", id: false, force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likers", ["user_id", "post_id"], name: "index_likers_on_user_id_and_post_id"

  create_table "members", id: false, force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["group_id", "user_id"], name: "index_members_on_group_id_and_user_id", unique: true

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "privacy"
    t.string   "img",          limit: 60
    t.string   "link",         limit: 60
    t.string   "media",        limit: 60
    t.integer  "likes"
    t.integer  "comments"
    t.string   "last_comment", limit: 60
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "profiles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.string  "details", limit: 100
    t.integer "privacy"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name", limit: 25
    t.string   "email",                 default: "", null: false
    t.string   "password",   limit: 40
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
