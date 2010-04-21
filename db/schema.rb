# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100421140052) do

  create_table "campuses", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "zip"
    t.string   "country"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campuses_cursuses", :id => false, :force => true do |t|
    t.integer "campus_id"
    t.integer "cursus_id"
  end

  create_table "cursuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean  "force_display",    :default => false
    t.integer  "speaker_id"
    t.string   "speaker_name"
    t.integer  "location_id"
    t.string   "location_name"
    t.integer  "event_scope_id"
    t.string   "event_scope_type"
    t.integer  "academical_id"
    t.string   "academical_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "global_event"
  end

  create_table "period_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.integer  "cursus_id"
    t.integer  "period_type_id"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "firstname",                 :limit => 100, :default => ""
    t.string   "lastname",                  :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
