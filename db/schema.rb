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

ActiveRecord::Schema.define(:version => 20130503005206) do

  create_table "competencies", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "description"
    t.integer  "category_id", :limit => 2
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "competency_level_requirements", :force => true do |t|
    t.string   "description"
    t.integer  "competency_level_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "competency_levels", :force => true do |t|
    t.integer  "level",         :limit => 1
    t.string   "description"
    t.integer  "competency_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "position_competency_levels", :force => true do |t|
    t.integer  "standard"
    t.integer  "position_id"
    t.integer  "competency_level_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",  :limit => 24,  :null => false
    t.string   "last_name",   :limit => 24,  :null => false
    t.string   "email",       :limit => 128, :null => false
    t.integer  "manager_id"
    t.date     "birthday"
    t.date     "joined_at"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "position_id"
  end

end