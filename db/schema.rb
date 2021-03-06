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

ActiveRecord::Schema.define(version: 20170118024056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",        limit: 50
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "building_id"
  end

  add_index "courses", ["building_id"], name: "index_courses_on_building_id", using: :btree
  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",        limit: 25
    t.string   "last_name",         limit: 50
    t.string   "email",                        default: "",    null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "password_digest"
    t.string   "activation_digest"
    t.boolean  "activated",                    default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
