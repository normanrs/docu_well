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

ActiveRecord::Schema.define(version: 2019_02_13_210710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insurances", force: :cascade do |t|
    t.integer "insurance_type", limit: 2
    t.string "carrier"
    t.string "id_number"
    t.string "group_number"
    t.string "phone_number"
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_insurances_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "given_name"
    t.string "surname"
    t.date "dob"
    t.integer "height", limit: 2
    t.integer "weight", limit: 2
    t.integer "bp_systolic", limit: 2
    t.integer "bp_diastolic", limit: 2
    t.integer "heart_rate", limit: 2
    t.integer "blood_type", limit: 2
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "insurances", "profiles"
  add_foreign_key "profiles", "users"
end
