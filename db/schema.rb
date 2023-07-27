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

ActiveRecord::Schema[7.0].define(version: 2023_07_27_071920) do
  create_table "applications", force: :cascade do |t|
    t.integer "app_id"
    t.string "student_id"
    t.integer "section_num"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", primary_key: "course_number", id: :string, force: :cascade do |t|
    t.string "course_name"
    t.text "course_description"
    t.string "campus"
    t.string "term"
  end

  create_table "grader_apply_applications", force: :cascade do |t|
    t.string "email"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade_id"
    t.string "student_id"
    t.string "course_num"
    t.string "score"
    t.boolean "qualified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.string "location"
    t.integer "section_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "section_number"
    t.integer "class_number"
    t.string "component"
    t.string "course_number"
    t.integer "graders_needed"
    t.integer "graders_assigned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_type"
    t.boolean "approved", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "users", column: "student_id", primary_key: "email"
  add_foreign_key "grades", "courses", column: "course_num", primary_key: "course_number"
  add_foreign_key "grades", "users", column: "student_id", primary_key: "email"
  add_foreign_key "sections", "courses", column: "course_number", primary_key: "course_number"
end
