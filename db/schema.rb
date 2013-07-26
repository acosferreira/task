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

ActiveRecord::Schema.define(:version => 20130725022054) do

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.date     "estimated_date"
    t.integer  "effort"
    t.integer  "recurrency_id"
    t.boolean  "status"
    t.integer  "job_id"
    t.integer  "type_task_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "jobs", ["recurrency_id"], :name => "index_jobs_on_recurrency_id"
  add_index "jobs", ["type_task_id"], :name => "index_jobs_on_type_task_id"

  create_table "names", :force => true do |t|
    t.string   "description"
    t.date     "estimated_date"
    t.integer  "effort"
    t.integer  "recurrency_id"
    t.boolean  "status"
    t.integer  "task_id"
    t.integer  "type_task_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "names", ["recurrency_id"], :name => "index_names_on_recurrency_id"
  add_index "names", ["type_task_id"], :name => "index_names_on_type_task_id"

  create_table "recurrencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_tasks", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
