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

ActiveRecord::Schema.define(:version => 20100623170528) do

  create_table "bug_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bugs", :force => true do |t|
    t.string   "description"
    t.integer  "report_id"
    t.integer  "bug_status_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "descriptions", :force => true do |t|
    t.text     "objective"
    t.text     "usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "developers", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.text     "status_description"
    t.integer  "report_rank"
  end

  create_table "export_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.string   "description"
    t.integer  "originator_id"
    t.integer  "owner_id"
    t.integer  "issue_status_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "j_tracs", :force => true do |t|
    t.string   "code"
    t.string   "project"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "navigations", :force => true do |t|
    t.integer  "tier_1"
    t.integer  "tier_2"
    t.integer  "tier_3"
    t.string   "package"
    t.string   "category"
    t.string   "program"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "report_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.integer  "description_id"
    t.integer  "navigation_id"
    t.integer  "jtrac_id"
    t.integer  "report_status_id"
    t.integer  "export_status_id"
    t.integer  "spec_status_id"
    t.integer  "test_status_id"
    t.integer  "developer_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "worker"
    t.integer  "usage_status_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "specs_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "notes"
    t.string   "jtrac_url"
    t.string   "jtrac_code"
    t.string   "jtrac_project"
    t.integer  "task_status_id"
    t.integer  "developer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_statuses", :force => true do |t|
    t.string   "status"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usage_statuses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "rank"
  end

end
