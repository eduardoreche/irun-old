require 'migration_helpers'

class CreateSprints < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :sprints do |t|
      t.text :comments
      t.integer :backlog_id

      t.timestamps
    end
    
    foreign_key :sprints, :backlog_id, :backlogs
  end

  def self.down
    drop_table :sprints
  end
end
