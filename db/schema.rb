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

ActiveRecord::Schema.define(version: 20150615152736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "strava_id"
    t.boolean  "soft_delete_flag", default: false, null: false
  end

  create_table "rides", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "distance",   precision: 5, scale: 2
    t.float    "elevation"
    t.decimal  "avg_speed",  precision: 5, scale: 2
    t.datetime "datetime"
    t.integer  "biker_id"
    t.string   "strava_id"
    t.text     "polyline"
    t.float    "lat_start"
    t.float    "lng_start"
    t.float    "lat_end"
    t.float    "lng_end"
    t.string   "type"
  end

  create_table "waypoints", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "ride_id"
  end

end
