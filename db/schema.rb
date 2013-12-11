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

ActiveRecord::Schema.define(version: 20131211192113) do

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "admin_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "education"
    t.string   "school_name1"
    t.string   "degree1"
    t.string   "area_of_study1"
    t.float    "gpa1"
    t.date     "graduation1"
    t.string   "school_name2"
    t.string   "degree2"
    t.string   "area_of_study2"
    t.float    "gpa2"
    t.date     "graduation2"
    t.string   "school_name3"
    t.string   "degree3"
    t.string   "area_of_study3"
    t.float    "gpa3"
    t.date     "graduation3"
    t.string   "skill1"
    t.integer  "skill1_years"
    t.string   "skill2"
    t.integer  "skill2_years"
    t.string   "skill3"
    t.integer  "skill3_years"
    t.string   "employment_situation"
    t.string   "occupation"
    t.string   "organization"
    t.string   "title"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "accepted",        default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "volunteer_apps", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "skype_name"
    t.date     "birth_date"
    t.string   "gender"
    t.string   "linked_in"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "citizenship_country"
    t.string   "street_address_home"
    t.string   "city_home"
    t.string   "state_home"
    t.integer  "zip_home"
    t.string   "country_home"
    t.string   "spanish_learned"
    t.string   "other_languages"
    t.string   "convicted"
    t.string   "visa_denied"
    t.string   "visa_explain"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",              default: "Pending Review"
  end

end
