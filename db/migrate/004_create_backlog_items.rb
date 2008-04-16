require 'migration_helpers'
class CreateBacklogItems < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :backlog_items do |t|
      t.string :description
      t.integer :backlog_id
      t.integer :product_id
      t.integer :iteration
      t.integer :points
      t.integer :user_id

      t.timestamps
    end
    
    foreign_key :backlog_items, :backlog_id, :backlogs
    foreign_key :backlog_items, :product_id, :products
    foreign_key :backlog_items, :user_id, :users
    
  end

  def self.down
    drop_table :backlog_items
  end
end
