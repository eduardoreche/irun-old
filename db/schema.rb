# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 8) do

  create_table "backlog_items", :force => true do |t|
    t.string   "description"
    t.integer  "backlog_id"
    t.integer  "product_id"
    t.integer  "iteration"
    t.integer  "points"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "backlog_items", ["backlog_id"], :name => "fk_backlog_items_backlogs"
  add_index "backlog_items", ["product_id"], :name => "fk_backlog_items_products"
  add_index "backlog_items", ["user_id"], :name => "fk_backlog_items_users"

  create_table "backlogs", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "comments"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sprints", :force => true do |t|
    t.text     "comments"
    t.integer  "backlog_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  add_index "sprints", ["backlog_id"], :name => "fk_sprints_backlogs"

  create_table "tasks", :force => true do |t|
    t.string   "description"
    t.text     "story"
    t.integer  "hours"
    t.integer  "backlog_item_id"
    t.integer  "sprint_id"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "init"
    t.datetime "end"
  end

  add_index "tasks", ["backlog_item_id"], :name => "fk_tasks_backlog_items"
  add_index "tasks", ["sprint_id"], :name => "fk_tasks_sprints"
  add_index "tasks", ["user_id"], :name => "fk_tasks_users"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.text     "comment"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
