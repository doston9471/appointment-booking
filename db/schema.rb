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

ActiveRecord::Schema[7.1].define(version: 2024_04_23_102623) do
  create_table "appointments", force: :cascade do |t|
    t.integer "coach_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_appointments_on_coach_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "full_name"
    t.string "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "coach_id", null: false
    t.string "day"
    t.time "available_start"
    t.time "available_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coach_id"], name: "index_schedules_on_coach_id"
  end

  add_foreign_key "appointments", "coaches"
  add_foreign_key "schedules", "coaches"
end
