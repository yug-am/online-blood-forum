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

ActiveRecord::Schema[7.0].define(version: 2022_11_20_054518) do
  create_table "donors", force: :cascade do |t|
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.string "email"
    t.integer "age"
    t.integer "mobileNo"
    t.string "gender"
    t.string "location"
    t.string "bloodGroup"
    t.string "donorID"
    t.string "govtID"
    t.boolean "isUsed"
    t.date "lastGivenDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "requestID"
    t.string "bloodType"
    t.string "location"
    t.boolean "isConfirmed"
    t.integer "allocationCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requestID"], name: "index_requests_on_requestID"
  end

end
