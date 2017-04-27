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

ActiveRecord::Schema.define(version: 20170427034005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_entities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendar_event_resource_links", force: :cascade do |t|
    t.integer  "calender_event_id"
    t.integer  "resouce_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "business_entity_id"
    t.integer  "cohort_id"
    t.integer  "event_type_id"
    t.string   "status"
    t.date     "updated_by"
    t.string   "created_by"
    t.datetime "updated_at"
    t.integer  "recurrences_id"
    t.index ["recurrences_id"], name: "index_calendar_events_on_recurrences_id", using: :btree
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
    t.index ["business_entity_id"], name: "index_cohorts_on_business_entity_id", using: :btree
  end

  create_table "contract_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "contract_type_id"
    t.integer  "rate"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["contract_type_id"], name: "index_contracts_on_contract_type_id", using: :btree
    t.index ["user_profile_id"], name: "index_contracts_on_user_profile_id", using: :btree
  end

  create_table "recurrences", force: :cascade do |t|
    t.integer  "business_entity_id"
    t.string   "repeat_pattern"
    t.integer  "week_day_mask"
    t.integer  "interval"
    t.string   "day_position"
    t.integer  "month_day"
    t.integer  "year_month"
    t.datetime "start_at"
    t.datetime "end_at"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "status"
    t.integer  "business_entity_id"
    t.integer  "resource_id"
    t.datetime "updated_at"
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "right_role_links", force: :cascade do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["right_id"], name: "index_right_role_links_on_right_id", using: :btree
    t.index ["role_id"], name: "index_right_role_links_on_role_id", using: :btree
  end

  create_table "rights", force: :cascade do |t|
    t.string   "code"
    t.string   "short_description"
    t.text     "long_description"
    t.string   "title"
    t.boolean  "public"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_profile_cohort_links", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "cohort_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["cohort_id"], name: "index_user_profile_cohort_links_on_cohort_id", using: :btree
    t.index ["user_profile_id"], name: "index_user_profile_cohort_links_on_user_profile_id", using: :btree
  end

  create_table "user_profile_role_links", force: :cascade do |t|
    t.integer  "user_profile_id"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["role_id"], name: "index_user_profile_role_links_on_role_id", using: :btree
    t.index ["user_profile_id"], name: "index_user_profile_role_links_on_user_profile_id", using: :btree
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "business_entity_id"
    t.index ["business_entity_id"], name: "index_user_profiles_on_business_entity_id", using: :btree
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
    t.index ["auth_token"], name: "index_users_on_auth_token", using: :btree
  end

  add_foreign_key "calendar_events", "recurrences", column: "recurrences_id"
  add_foreign_key "cohorts", "business_entities"
  add_foreign_key "contracts", "contract_types"
  add_foreign_key "contracts", "user_profiles"
  add_foreign_key "right_role_links", "rights"
  add_foreign_key "right_role_links", "roles"
  add_foreign_key "user_profile_cohort_links", "cohorts"
  add_foreign_key "user_profile_cohort_links", "user_profiles"
  add_foreign_key "user_profile_role_links", "roles"
  add_foreign_key "user_profile_role_links", "user_profiles"
  add_foreign_key "user_profiles", "business_entities"
  add_foreign_key "user_profiles", "users"
end
