class Task < ActiveRecord::Base
  
  belongs_to :sprint
  belongs_to :backlog_item
  belongs_to :user
  has_many :comments
  
  validates_presence_of :sprint
  validates_presence_of :backlog_item
  validates_presence_of :hours
  validates_numericality_of :hours
  validates_presence_of :description
  
  def destroy
    self.comments.each do |comment| 
      comment.destroy
    end
    
    super
  end

#  def spended_time
#    if self.status == PRONTO
#      spended_time = self.end - self.init
#    end
#  end
end
