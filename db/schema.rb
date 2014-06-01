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

ActiveRecord::Schema.define(version: 20140601161342) do

  create_table "metrics", force: true do |t|
    t.float    "measure"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plant_id"
  end

  add_index "metrics", ["type"], name: "index_metrics_on_type"

  create_table "plants", force: true do |t|
    t.string   "name"
    t.string   "nickname"
    t.date     "planted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "water",      default: false
    t.boolean  "happy"
    t.boolean  "heat",       default: false
  end

end
