require 'migration_helpers'

class CreateDevelopers < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :developers do |t|
      t.integer :sprint_id
      t.integer :user_id
      t.integer :hours

      t.timestamps
    end
    
    foreign_key :developers, :sprint_id, :sprints
    foreign_key :developers, :user_id, :users
    
  end

  def self.down
    drop_table :developers
  end
end
