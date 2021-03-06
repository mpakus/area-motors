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

ActiveRecord::Schema.define(version: 2018_08_16_100853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email"
    t.index ["name"], name: "index_customers_on_name"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "source", limit: 64
    t.text "message"
    t.text "addon"
    t.string "status"
    t.jsonb "error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_enquiries_on_customer_id"
    t.index ["email"], name: "index_enquiries_on_email"
    t.index ["name"], name: "index_enquiries_on_name"
    t.index ["source"], name: "index_enquiries_on_source"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "customer_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_notes_on_customer_id"
  end

  add_foreign_key "enquiries", "customers"
end
