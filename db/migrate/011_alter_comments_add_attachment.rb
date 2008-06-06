class AlterCommentsAddAttachment < ActiveRecord::Migration
  def self.up
    add_column :comments, :attachment, :string
  end

  def self.down
    remove_column :comments, :attachment
  end
end
