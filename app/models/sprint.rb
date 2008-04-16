class Sprint < ActiveRecord::Base
  
  belongs_to :backlog
  has_many :tasks
  has_many :developers
  
  validates_associated :backlog
  
  def developers_hours
    conn = ActiveRecord::Base.connection
    
    result = conn.select_one("select sum(hours) from developers where sprint_id = #{self.id}")
    developers_hours = result['sum(hours)']
  end
  
  def tasks_hours
    conn = ActiveRecord::Base.connection
    
    result = conn.select_one("select sum(hours) from tasks where sprint_id = #{self.id}")
    tasks_hours = result['sum(hours)']
  end
  
end
