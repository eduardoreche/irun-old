class AlterSprintsAddActive < ActiveRecord::Migration
  def self.up
    add_column :sprints, :active, :boolean
  end

  def self.down
    remove_column :sprints, :active
  end
end
