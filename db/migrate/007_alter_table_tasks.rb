class AlterTableTasks < ActiveRecord::Migration
  def self.up
    remove_column :tasks, :init
    remove_column :tasks, :end
    
    add_column "tasks", "init", :datetime
    add_column :tasks, :end, :datetime
  end

  def self.down
    remove_column :tasks, :init
    remove_column :tasks, :end
    
    add_column "tasks", "init", :date
    add_column :tasks, :end, :date
  end
end
