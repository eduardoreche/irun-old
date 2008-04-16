class Task < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :backlog_item
  belongs_to :user
  
end
