class Task < ActiveRecord::Base
  
  belongs_to :sprint
  belongs_to :backlog_item
  belongs_to :user
  

#  def spended_time
#    if self.status == PRONTO
#      spended_time = self.end - self.init
#    end
#  end
end
