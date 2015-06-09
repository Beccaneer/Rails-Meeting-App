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

ActiveRecord::Schema.define(:version => 20121214172506) do

  create_table "attendees", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.integer  "weight"
  end

  create_table "discussions", :force => true do |t|
    t.text     "item"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "meeting_id"
    t.integer  "user_id"
  end

  create_table "meetings", :force => true do |t|
    t.integer  "user_id",     :limit => 255
    t.datetime "date",        :limit => 255
    t.string   "place"
    t.datetime "time",        :limit => 255
    t.text     "description"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "end"
    t.string   "title"
    t.datetime "endtime",     :limit => 255
    t.boolean  "reminders"
    t.text     "item"
    t.boolean  "all"
  end

  create_table "users", :force => true do |t|
    t.boolean  "admin"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "watiam"
    t.datetime "birthday"
  end

end
