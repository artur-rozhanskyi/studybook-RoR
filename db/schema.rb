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

ActiveRecord::Schema.define(version: 2019_09_26_082723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriages", force: :cascade do |t|
    t.integer "bottom_places"
    t.integer "upper_places"
    t.bigint "train_id"
    t.string "type"
    t.integer "side_bottom_places"
    t.integer "side_upper_places"
    t.integer "seats"
    t.integer "number"
    t.index ["id", "type"], name: "index_carriages_on_id_and_type"
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "railway_station_id", null: false
    t.integer "position"
    t.datetime "arrival"
    t.datetime "departure"
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id", "railway_station_id"], name: "index_railway_stations_routes", unique: true
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_trains", id: false, force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "train_id", null: false
    t.index ["route_id", "train_id"], name: "index_routes_trains_on_route_id_and_train_id"
    t.index ["route_id"], name: "index_routes_trains_on_route_id"
    t.index ["train_id"], name: "index_routes_trains_on_train_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "first_station_id"
    t.integer "last_station_id"
    t.bigint "user_id"
    t.string "name"
    t.string "middle_name"
    t.string "last_name"
    t.string "passport"
    t.datetime "arrival"
    t.datetime "departure"
    t.index ["first_station_id"], name: "index_tickets_on_first_station_id"
    t.index ["last_station_id"], name: "index_tickets_on_last_station_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_station_id"
    t.boolean "sort"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.string "name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carriages", "trains"
  add_foreign_key "tickets", "users"
  add_foreign_key "trains", "railway_stations", column: "current_station_id"
end
