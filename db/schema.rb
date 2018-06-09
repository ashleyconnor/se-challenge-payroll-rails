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

ActiveRecord::Schema.define(version: 2018_06_09_214054) do

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "employee_id"
    t.integer "job_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employees_on_employee_id", unique: true
    t.index ["job_group_id"], name: "index_employees_on_job_group_id", unique: true
  end

  create_table "job_groups", force: :cascade do |t|
    t.string "code", null: false
    t.decimal "hourly_wage", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_job_groups_on_code", unique: true
  end

  create_table "time_entries", force: :cascade do |t|
    t.string "workday"
    t.integer "hours_worked"
    t.integer "employee_id"
    t.integer "job_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_time_entries_on_employee_id"
    t.index ["job_group_id"], name: "index_time_entries_on_job_group_id"
  end

end
