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

ActiveRecord::Schema.define(version: 2019_09_23_123033) do

  create_table "carriages", force: :cascade do |t|
    t.integer "bottom_places"
    t.integer "upper_places"
    t.integer "carriage_type_id"
    t.integer "train_id"
    t.string "type"
    t.integer "side_bottom_places"
    t.integer "side_upper_places"
    t.integer "seats"
    t.integer "number"
    t.index ["carriage_type_id"], name: "index_carriages_on_carriage_type_id"
    t.index ["train_id"], name: "index_carriages_on_train_id"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "route_id", null: false
    t.integer "railway_station_id", null: false
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
    t.integer "route_id", null: false
    t.integer "train_id", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "first_station_id"
    t.integer "last_station_id"
    t.integer "user_id"
    t.string "name"
    t.string "middle_name"
    t.string "last_name"
    t.string "passport"
    t.datetime "arrival"
    t.datetime "departure"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_station_id"
    t.boolean "sort"
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'booleam' for column 'admin'

end
