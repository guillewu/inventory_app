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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131125002520) do

  create_table "discounts", :force => true do |t|
    t.integer  "room_id",                   :null => false
    t.date     "start_date",                :null => false
    t.date     "end_date",                  :null => false
    t.float    "disc_rate",                 :null => false
    t.integer  "los",        :default => 1, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "discounts", ["room_id"], :name => "index_discounts_on_room_id"

  create_table "hotels", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "address",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hotels", ["name"], :name => "index_hotels_on_name", :unique => true

  create_table "prices", :force => true do |t|
    t.integer  "room_id",    :null => false
    t.integer  "qty",        :null => false
    t.float    "price",      :null => false
    t.date     "start_date", :null => false
    t.date     "end_date",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "prices", ["room_id"], :name => "index_prices_on_room_id"

  create_table "rooms", :force => true do |t|
    t.integer  "hotel_id",   :null => false
    t.integer  "max_people"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "rooms", ["hotel_id"], :name => "index_rooms_on_hotel_id"

end
