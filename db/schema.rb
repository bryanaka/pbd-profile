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

ActiveRecord::Schema.define(:version => 20130626212731) do

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scientist_titles", :force => true do |t|
    t.string  "title"
    t.integer "scientist_id"
    t.integer "order"
  end

  create_table "scientist_websites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.integer  "scientist_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "order"
  end

  create_table "scientists", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "picture"
    t.string   "title"
    t.string   "slug"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "visible",    :default => true
    t.boolean  "tester",     :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "eppn"
    t.string   "name"
    t.string   "email"
    t.string   "picture"
    t.integer  "scientist_id"
    t.boolean  "confirmed",    :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

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
