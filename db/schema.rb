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

ActiveRecord::Schema.define(:version => 20121018004224) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "appraisal_activities", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "user_id"
    t.integer  "activity_type"
    t.integer  "activity_value"
    t.datetime "activity_datetime"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "appraisal_activities", ["user_id"], :name => "index_appraisal_activities_on_user_id"

  create_table "appraisal_data", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "datatype"
    t.string   "value"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "appraisal_data", ["appraisal_id"], :name => "index_appraisal_data_on_appraisal_id"

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
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "created_by"
    t.integer  "assigned_to"
    t.integer  "assigned_on"
    t.text     "inscriptions"
    t.text     "item_history"
    t.text     "appraisal_info"
    t.integer  "appraisal_type"
    t.boolean  "shared",                    :default => false
  end

  add_index "appraisals", ["assigned_to"], :name => "index_appraisals_on_assigned_to"
  add_index "appraisals", ["created_by"], :name => "index_appraisals_on_created_by"

  create_table "appraiser_access_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.string   "email"
    t.string   "name"
    t.datetime "used_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "appraiser_access_tokens", ["user_id"], :name => "index_appraiser_access_tokens_on_user_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "ancestry"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"

  create_table "classifications", :force => true do |t|
    t.integer  "appraisal_id"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "classifications", ["appraisal_id"], :name => "index_classifications_on_appraisal_id"
  add_index "classifications", ["category_id"], :name => "index_classifications_on_category_id"

  create_table "cms_blocks", :force => true do |t|
    t.integer  "page_id",    :null => false
    t.string   "identifier", :null => false
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cms_blocks", ["page_id", "identifier"], :name => "index_cms_blocks_on_page_id_and_identifier"

  create_table "cms_categories", :force => true do |t|
    t.integer "site_id",          :null => false
    t.string  "label",            :null => false
    t.string  "categorized_type", :null => false
  end

  add_index "cms_categories", ["site_id", "categorized_type", "label"], :name => "index_cms_categories_on_site_id_and_categorized_type_and_label", :unique => true

  create_table "cms_categorizations", :force => true do |t|
    t.integer "category_id",      :null => false
    t.string  "categorized_type", :null => false
    t.integer "categorized_id",   :null => false
  end

  add_index "cms_categorizations", ["category_id", "categorized_type", "categorized_id"], :name => "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", :unique => true

  create_table "cms_files", :force => true do |t|
    t.integer  "site_id",                                          :null => false
    t.integer  "block_id"
    t.string   "label",                                            :null => false
    t.string   "file_file_name",                                   :null => false
    t.string   "file_content_type",                                :null => false
    t.integer  "file_file_size",                                   :null => false
    t.string   "description",       :limit => 2048
    t.integer  "position",                          :default => 0, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "cms_files", ["site_id", "block_id"], :name => "index_cms_files_on_site_id_and_block_id"
  add_index "cms_files", ["site_id", "file_file_name"], :name => "index_cms_files_on_site_id_and_file_file_name"
  add_index "cms_files", ["site_id", "label"], :name => "index_cms_files_on_site_id_and_label"
  add_index "cms_files", ["site_id", "position"], :name => "index_cms_files_on_site_id_and_position"

  create_table "cms_layouts", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.integer  "parent_id"
    t.string   "app_layout"
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.text     "css"
    t.text     "js"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_layouts", ["parent_id", "position"], :name => "index_cms_layouts_on_parent_id_and_position"
  add_index "cms_layouts", ["site_id", "identifier"], :name => "index_cms_layouts_on_site_id_and_identifier", :unique => true

  create_table "cms_pages", :force => true do |t|
    t.integer  "site_id",                           :null => false
    t.integer  "layout_id"
    t.integer  "parent_id"
    t.integer  "target_page_id"
    t.string   "label",                             :null => false
    t.string   "slug"
    t.string   "full_path",                         :null => false
    t.text     "content"
    t.integer  "position",       :default => 0,     :null => false
    t.integer  "children_count", :default => 0,     :null => false
    t.boolean  "is_published",   :default => true,  :null => false
    t.boolean  "is_shared",      :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "cms_pages", ["parent_id", "position"], :name => "index_cms_pages_on_parent_id_and_position"
  add_index "cms_pages", ["site_id", "full_path"], :name => "index_cms_pages_on_site_id_and_full_path"

  create_table "cms_revisions", :force => true do |t|
    t.string   "record_type", :null => false
    t.integer  "record_id",   :null => false
    t.text     "data"
    t.datetime "created_at"
  end

  add_index "cms_revisions", ["record_type", "record_id", "created_at"], :name => "index_cms_revisions_on_record_type_and_record_id_and_created_at"

  create_table "cms_sites", :force => true do |t|
    t.string  "label",                          :null => false
    t.string  "identifier",                     :null => false
    t.string  "hostname",                       :null => false
    t.string  "path"
    t.string  "locale",      :default => "en",  :null => false
    t.boolean "is_mirrored", :default => false, :null => false
  end

  add_index "cms_sites", ["hostname"], :name => "index_cms_sites_on_hostname"
  add_index "cms_sites", ["is_mirrored"], :name => "index_cms_sites_on_is_mirrored"

  create_table "cms_snippets", :force => true do |t|
    t.integer  "site_id",                       :null => false
    t.string   "label",                         :null => false
    t.string   "identifier",                    :null => false
    t.text     "content"
    t.integer  "position",   :default => 0,     :null => false
    t.boolean  "is_shared",  :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "cms_snippets", ["site_id", "identifier"], :name => "index_cms_snippets_on_site_id_and_identifier", :unique => true
  add_index "cms_snippets", ["site_id", "position"], :name => "index_cms_snippets_on_site_id_and_position"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "appraisal_id"
    t.boolean  "is_charged"
    t.string   "auth_code"
    t.string   "ccnum"
    t.float    "amount"
    t.boolean  "is_refund"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "payments", ["appraisal_id"], :name => "index_payments_on_appraisal_id"
  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

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

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "skills", :force => true do |t|
    t.string   "discipline"
    t.integer  "since"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  add_index "skills", ["category_id"], :name => "index_skills_on_category_id"
  add_index "skills", ["user_id"], :name => "index_skills_on_user_id"

  create_table "tags", :force => true do |t|
    t.integer  "photo_id"
    t.string   "label"
    t.integer  "width"
    t.integer  "height"
    t.integer  "top"
    t.integer  "left"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "tags", ["photo_id"], :name => "index_tags_on_photo_id"
  add_index "tags", ["user_id"], :name => "index_tags_on_user_id"

  create_table "tickets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "appraisal_id"
    t.integer  "task_mapper_id"
    t.string   "task_mapper_provider"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "tickets", ["appraisal_id"], :name => "index_tickets_on_appraisal_id"
  add_index "tickets", ["user_id"], :name => "index_tickets_on_user_id"

  create_table "trade_references", :force => true do |t|
    t.string   "company"
    t.string   "contact"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trade_references", ["user_id"], :name => "index_trade_references_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",                    :null => false
    t.string   "encrypted_password",                    :default => "",                    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "role"
    t.boolean  "notify_by_sms",                         :default => false
    t.boolean  "notify_by_email",                       :default => true
    t.integer  "next_notification_interval_in_minutes", :default => 60
    t.datetime "next_notification_due_at",              :default => '2012-09-11 23:57:57'
    t.string   "payment_method",                        :default => "cheque"
    t.boolean  "uspap",                                 :default => false
    t.string   "name"
    t.string   "facebook_token"
    t.string   "facebook_location"
    t.string   "facebook_location_id"
    t.string   "facebook_gender"
    t.string   "facebook_verified"
    t.string   "facebook_updated"
    t.string   "facebook_locale"
    t.string   "facebook_id"
    t.text     "appraiser_info"
    t.string   "username"
    t.text     "signature_json"
    t.string   "signature_file_name"
    t.string   "signature_content_type"
    t.integer  "signature_file_size"
    t.datetime "signature_updated_at"
    t.integer  "status"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
