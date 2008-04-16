require 'migration_helpers'

class CreateTasks < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :tasks do |t|
      t.string :description
      t.text :story
      t.integer :hours
      t.integer :backlog_item_id
      t.integer :sprint_id
      t.string :status
      t.integer :user_id
      t.date :init
      t.date :end

      t.timestamps
    end
    
    foreign_key :tasks, :backlog_item_id, :backlog_items
    foreign_key :tasks, :sprint_id, :sprints
    foreign_key :tasks, :user_id, :users
    
  end

  def self.down
    drop_table :tasks
  end
end
