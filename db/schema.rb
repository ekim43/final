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

ActiveRecord::Schema.define(version: 0) do

  create_table "appointments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "doctor_id"
    t.integer "test_id"
    t.date    "date"
    t.time    "time"
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id"
  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id"
  add_index "appointments", ["test_id"], name: "index_appointments_on_test_id"

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "specialty"
    t.string "new_patients"
    t.string "image"
    t.string "education"
  end

  create_table "patients", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "password_digest"
    t.string  "email"
    t.string  "gender"
    t.string  "marital_status"
    t.string  "blood_type"
    t.boolean "admin",           default: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
  end

end
