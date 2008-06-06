class Task < ActiveRecord::Base
  
  belongs_to :sprint
  belongs_to :backlog_item
  belongs_to :user
  has_many :comments
  
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
