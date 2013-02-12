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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211043120) do

  create_table "event_memberships", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "author_id"
  end

  add_index "event_memberships", ["event_id"], :name => "index_event_memberships_on_event_id"
  add_index "event_memberships", ["user_id", "event_id"], :name => "index_event_memberships_on_user_id_and_event_id", :unique => true
  add_index "event_memberships", ["user_id"], :name => "index_event_memberships_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "date"
    t.integer  "location_id"
  end

  add_index "events", ["date"], :name => "index_events_on_date"

  create_table "locate_tags", :force => true do |t|
    t.integer  "location_id"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "state"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loop_event_shares", :force => true do |t|
    t.integer  "loop_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "loop_event_shares", ["event_id"], :name => "index_loop_event_shares_on_event_id"
  add_index "loop_event_shares", ["loop_id", "event_id"], :name => "index_loop_event_shares_on_loop_id_and_event_id", :unique => true
  add_index "loop_event_shares", ["loop_id"], :name => "index_loop_event_shares_on_loop_id"

  create_table "loop_memberships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "loop_id"
    t.string   "status"
    t.boolean  "creator",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false
    t.integer  "author_id"
  end

  add_index "loop_memberships", ["loop_id"], :name => "index_loop_memberships_on_loop_id"
  add_index "loop_memberships", ["user_id", "loop_id"], :name => "index_loop_memberships_on_user_id_and_loop_id", :unique => true
  add_index "loop_memberships", ["user_id"], :name => "index_loop_memberships_on_user_id"

  create_table "loops", :force => true do |t|
    t.string   "privacy"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "organizations", ["name"], :name => "index_organizations_on_name"
  add_index "organizations", ["remember_token"], :name => "index_organizations_on_remember_token"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "comment_id"
    t.string   "comment_type"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["event_id"], :name => "index_taggings_on_event_id"
  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "name"
    t.string   "pic_link"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
