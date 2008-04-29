class Sprint < ActiveRecord::Base
  
  belongs_to :backlog
  has_many :tasks
  has_many :developers
  
  validates_associated :backlog
  
  def developers_hours
    developers_hours = Developer.sum(:hours, :conditions => ["sprint_id = ?", self.id])
  end
  
  def tasks_hours
    tasks_hours = Task.sum(:hours, :conditions => ["sprint_id = ?", self.id])
  end
  
  def concluded_tasks
    concluded_tasks = Task.sum(:hours, :conditions => ["sprint_id = ? and status = 'Pronto'", self.id])
  end
  
end
