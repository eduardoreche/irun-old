class Developer < ActiveRecord::Base
  
  belongs_to :sprint
  belongs_to :user
  
end
