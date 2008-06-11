class Sprint < ActiveRecord::Base
  
  belongs_to :backlog
  has_many :tasks
  has_many :developers
  
  validates_associated :backlog
  
  def complete
    begin
      (concluded_tasks * 100) / tasks_hours
    rescue
      0
    end
  end
  
  def developers_hours
    developers_hours = Developer.sum(:hours, :conditions => ["sprint_id = ?", self.id])
  end
  
  def tasks_hours
    tasks_hours = Task.sum(:hours, :conditions => ["sprint_id = ?", self.id])
  end
  
  def concluded_tasks
    concluded_tasks = Task.sum(:hours, :conditions => ["sprint_id = ? and status = 'Pronto'", self.id])
  end
  
  def developers_percent_hours
    developer_hours = Task.sum(:hours, 
                          :conditions => ["sprints.id = ? and tasks.status = 'Pronto'",self.id],
                          :include => [:sprint,:user],
                          :group => 'users.name',
                          :order => 'sum_hours desc')
    
    
    developer_hours.each do |dev|
      dev[0] = dev[0].split(' ')[0]
      dev[1] = dev[1]*100/concluded_tasks
    end
  end
    
end
