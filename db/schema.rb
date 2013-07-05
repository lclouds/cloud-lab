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

ActiveRecord::Schema.define(:version => 20130702074713) do

  create_table "administrators", :force => true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "administrators", ["email"], :name => "index_administrators_on_email", :unique => true
  add_index "administrators", ["reset_password_token"], :name => "index_administrators_on_reset_password_token", :unique => true

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

  create_table "clclass_teachers", :force => true do |t|
    t.integer  "clclass_id"
    t.integer  "teacher_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clclasses", :force => true do |t|
    t.string   "teacher"
    t.text     "class_description"
    t.date     "starting_date"
    t.string   "teaser"
    t.string   "schedule"
    t.string   "workload"
    t.text     "technical_requirements"
    t.text     "prerequisites"
    t.text     "course_content"
    t.text     "team_projects"
    t.text     "evaluation"
    t.text     "statement_accomplishment"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "course_id"
  end

  create_table "clclasses_users", :force => true do |t|
    t.integer  "clclass_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "course_name"
    t.integer  "course_code"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lectures", :force => true do |t|
    t.string   "name"
    t.string   "video"
    t.string   "slides"
    t.string   "transcript"
    t.text     "key_concepts"
    t.text     "reading"
    t.text     "assignment"
    t.text     "additional_rsources"
    t.integer  "course_id"
    t.integer  "clclass_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "alias_name"
    t.string   "valid_certificate"
    t.string   "valid_certificate_no"
    t.string   "email"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "address"
    t.string   "postcode"
    t.string   "title"
    t.string   "position"
    t.text     "resume"
    t.string   "image_url"
    t.string   "regist_name"
    t.string   "comment"
    t.integer  "deleted"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "avatar"
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email"
  add_index "teachers", ["remember_token"], :name => "index_teachers_on_remember_token"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "mobile"
    t.date     "reg_date"
    t.date     "last_date"
    t.string   "language"
    t.string   "age"
    t.string   "gender"
    t.text     "bio"
    t.string   "education"
    t.string   "city"
    t.string   "avatar"
    t.string   "qq"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
