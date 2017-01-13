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

ActiveRecord::Schema.define(version: 20170107233639) do

  create_table "business_entities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "max_capacity"
    t.integer  "number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "business_entity_id"
    t.index ["business_entity_id"], name: "index_cohorts_on_business_entity_id"
  end

  create_table "right_role_links", force: :cascade do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["right_id"], name: "index_right_role_links_on_right_id"
    t.index ["role_id"], name: "index_right_role_links_on_role_id"
  end

  create_table "rights", force: :cascade do |t|
    t.string   "code"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "title"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "public",            default: true
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_profile_role_links", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["role_id"], name: "index_user_profile_role_links_on_role_id"
    t.index ["user_profile_id"], name: "index_user_profile_role_links_on_user_profile_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cohort_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "business_entity_id"
    t.index ["business_entity_id"], name: "index_user_profiles_on_business_entity_id"
    t.index ["cohort_id"], name: "index_user_profiles_on_cohort_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
