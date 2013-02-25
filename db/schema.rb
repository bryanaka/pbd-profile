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

ActiveRecord::Schema.define(:version => 20130224102941) do

  create_table "scientist_profiles", :force => true do |t|
    t.string   "prefix"
    t.string   "department"
    t.string   "department_url"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip_code"
    t.string   "phone1"
    t.string   "phone2_type"
    t.string   "phone2"
    t.string   "email"
    t.text     "summary"
    t.text     "emphasis"
    t.text     "location"
    t.integer  "scientist_id"
    t.string   "publications_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "scientist_titles", :force => true do |t|
    t.string  "title"
    t.integer "scientist_id"
  end

  create_table "scientist_websites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.integer  "scientist_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "scientists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.string   "scientist"
    t.text     "description"
    t.date     "date"
    t.string   "vid_type"
    t.string   "vid_code"
    t.string   "poster"
    t.integer  "views"
    t.string   "vid_link"
    t.integer  "scientist_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
