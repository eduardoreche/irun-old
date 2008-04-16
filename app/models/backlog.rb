class Backlog < ActiveRecord::Base
  
  has_many :backlog_items
  has_many :sprints
  
  validates_presence_of :name
  
end
