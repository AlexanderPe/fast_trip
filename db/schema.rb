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

ActiveRecord::Schema.define(:version => 20131225230305) do

  create_table "aviasalers", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "actual_time"
    t.decimal  "price"
    t.integer  "trip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "back_side"
  end

  add_index "aviasalers", ["trip_id", "created_at"], :name => "index_aviasalers_on_trip_id_and_created_at"

  create_table "hotels", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "five_stars"
    t.integer  "trip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "hotels", ["trip_id", "created_at"], :name => "index_hotels_on_trip_id_and_created_at"

  create_table "hotelsalers", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "actual_time"
    t.decimal  "price_one"
    t.decimal  "price_two"
    t.integer  "trip_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "five_stars"
  end

  add_index "hotelsalers", ["trip_id", "created_at"], :name => "index_hotelsalers_on_trip_id_and_created_at"

  create_table "tickets", :force => true do |t|
    t.string   "departure_city"
    t.string   "departure_code"
    t.datetime "departure_time"
    t.string   "arrival_city"
    t.string   "arrival_code"
    t.datetime "arrival_time"
    t.string   "aviacompany"
    t.string   "flight"
    t.integer  "trip_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "back_side"
    t.boolean  "change"
  end

  add_index "tickets", ["trip_id", "created_at"], :name => "index_tickets_on_trip_id_and_created_at"

  create_table "trips", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "no_visa"
    t.string   "city"
    t.string   "country"
  end

  add_index "trips", ["user_id", "created_at"], :name => "index_trips_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "password_reset_token"
    t.time     "password_reset_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
