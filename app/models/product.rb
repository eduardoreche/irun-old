class Product < ActiveRecord::Base
  
  has_many :backlog_items
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
