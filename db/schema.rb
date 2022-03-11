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

ActiveRecord::Schema.define(version: 2022_03_04_161528) do

  create_table "donations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "donation_amount"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "year"
    t.integer "user_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.string "address_1"
    t.string "address_2"
    t.text "city"
    t.text "state"
    t.integer "zip_code"
    t.string "email"
    t.integer "phone"
    t.string "password"
    t.string "username"
    t.integer "doner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
