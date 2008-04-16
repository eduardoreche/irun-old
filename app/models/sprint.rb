class Sprint < ActiveRecord::Base
  
  belongs_to :backlog
  has_many :tasks
  
  validates_associated :backlog
  
end
