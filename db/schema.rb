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

ActiveRecord::Schema.define(:version => 20121228210530) do

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
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
