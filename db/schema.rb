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

ActiveRecord::Schema[8.1].define(version: 2026_03_10_050002) do
  create_table "care_plan_templates", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_care_plan_templates_on_user_id"
  end

  create_table "care_plans", force: :cascade do |t|
    t.integer "care_plan_template_id", null: false
    t.datetime "created_at", null: false
    t.integer "patient_id", null: false
    t.date "reference_date", null: false
    t.string "status", default: "active", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["care_plan_template_id"], name: "index_care_plans_on_care_plan_template_id"
    t.index ["patient_id"], name: "index_care_plans_on_patient_id"
    t.index ["user_id"], name: "index_care_plans_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.date "birth_date", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.string "email"
    t.string "name", null: false
    t.string "phone", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "protocol_step_templates", force: :cascade do |t|
    t.integer "care_plan_template_id", null: false
    t.datetime "created_at", null: false
    t.integer "day_offset", null: false
    t.text "message_body", null: false
    t.datetime "updated_at", null: false
    t.index ["care_plan_template_id"], name: "index_protocol_step_templates_on_care_plan_template_id"
  end

  create_table "protocol_steps", force: :cascade do |t|
    t.integer "care_plan_id", null: false
    t.datetime "created_at", null: false
    t.integer "day_offset", null: false
    t.text "message_body", null: false
    t.integer "protocol_step_template_id", null: false
    t.date "scheduled_date", null: false
    t.string "status", default: "pending", null: false
    t.datetime "updated_at", null: false
    t.index ["care_plan_id"], name: "index_protocol_steps_on_care_plan_id"
    t.index ["protocol_step_template_id"], name: "index_protocol_steps_on_protocol_step_template_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "care_plan_templates", "users"
  add_foreign_key "care_plans", "care_plan_templates"
  add_foreign_key "care_plans", "patients"
  add_foreign_key "care_plans", "users"
  add_foreign_key "patients", "users"
  add_foreign_key "protocol_step_templates", "care_plan_templates"
  add_foreign_key "protocol_steps", "care_plans"
  add_foreign_key "protocol_steps", "protocol_step_templates"
  add_foreign_key "sessions", "users"
end
