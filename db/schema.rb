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

ActiveRecord::Schema.define(version: 20160125191923) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "status"
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id"

  create_table "timekeepings", force: :cascade do |t|
    t.datetime "clock_in"
    t.datetime "clock_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "timekeepings", ["project_id"], name: "index_timekeepings_on_project_id"
  add_index "timekeepings", ["user_id"], name: "index_timekeepings_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "users_projects", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "users_projects", ["project_id"], name: "index_users_projects_on_project_id"
  add_index "users_projects", ["user_id"], name: "index_users_projects_on_user_id"

end
