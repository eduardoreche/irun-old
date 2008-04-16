class BacklogItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :user
  
  validates_presence_of :description
  validates_presence_of :product_id
  validates_presence_of :points
  validates_numericality_of :points
  validates_presence_of :user_id
  
end
