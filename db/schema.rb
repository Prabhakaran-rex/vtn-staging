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

ActiveRecord::Schema.define(:version => 20120817003456) do

  create_table "appraisals", :force => true do |t|
    t.string   "name"
    t.string   "dimensions"
    t.string   "materials"
    t.string   "country_of_origin"
    t.string   "makers_marks"
    t.string   "damage"
    t.string   "year_of_manufacture"
    t.string   "where_was_it_obtained"
    t.string   "how_was_it_obtained"
    t.string   "appraiser_number"
    t.string   "value_of_item"
    t.string   "historical_significance"
    t.string   "number_of_pieces_created"
    t.string   "where_it_was_manufactured"
    t.string   "when_it_was_used"
    t.string   "how_it_was_used"
    t.integer  "selected_plan"
    t.integer  "status"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "user_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  add_index "photos", ["appraisal_id"], :name => "index_photos_on_appraisal_id"
  add_index "photos", ["user_id"], :name => "index_photos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
