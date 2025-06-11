# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_09_113325) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "race_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "race_id", null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_race_events_on_event_id"
    t.index ["race_id"], name: "index_race_events_on_race_id"
  end

  create_table "race_result_comments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "race_result_id", null: false
    t.string "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["race_result_id"], name: "index_race_result_comments_on_race_result_id"
    t.index ["user_id"], name: "index_race_result_comments_on_user_id"
  end

  create_table "race_results", force: :cascade do |t|
    t.integer "record_time_in_seconds"
    t.text "impression"
    t.bigint "user_id", null: false
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_results_on_race_id", unique: true
    t.index ["user_id"], name: "index_race_results_on_user_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.date "payment_due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "stay_plans", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.string "place_name"
    t.string "address"
    t.datetime "check_in_time"
    t.datetime "check_out_time"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_stay_plans_on_race_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "bio"
    t.string "role"
    t.string "gender"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "race_events", "events"
  add_foreign_key "race_events", "races"
  add_foreign_key "race_result_comments", "race_results"
  add_foreign_key "race_result_comments", "users"
  add_foreign_key "race_results", "races"
  add_foreign_key "race_results", "users"
  add_foreign_key "stay_plans", "races"
end
