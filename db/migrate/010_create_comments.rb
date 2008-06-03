require 'migration_helpers'

class CreateComments < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :comments do |t|
      t.integer :task_id
      t.integer :user_id
      t.text :comment

      t.timestamps
    end
    
    foreign_key :comments, :task_id, :tasks
    foreign_key :comments, :user_id, :users
  end

  def self.down
    drop_table :comments
  end
end
