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

ActiveRecord::Schema.define(version: 20170929045550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "rates", force: :cascade do |t|
    t.integer "rate", null: false
    t.string "origin", limit: 2, null: false
    t.string "destination", limit: 2, null: false
    t.bigint "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_provider_id"], name: "index_rates_on_service_provider_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "name", null: false
    t.integer "flat_rate_cents", default: 0, null: false
    t.string "flat_rate_currency", default: "USD", null: false
    t.integer "flat_rate_usd_cents", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "rates", "service_providers"
end
