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

ActiveRecord::Schema.define(version: 2019_06_06_014810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer "employer_id"
    t.integer "student_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
  end

  create_table "employers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.string "company"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "email"
    t.text "university"
    t.float "gpa"
    t.text "profile_photo"
    t.text "cv"
    t.integer "reserve_price"
    t.datetime "auction_duration"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employer_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "employer_id"
    t.integer "student_id"
    t.text "student_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "employer_email"
  end

end
