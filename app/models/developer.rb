class Developer < ActiveRecord::Base
  
  belongs_to :sprint
  belongs_to :user
  
  def tarefas_alocadas
    tarefas = self.user.tasks.count(:all, :conditions =>
                                    ["sprint_id = ? and status = 'Alocado'", self.sprint_id])
    if tarefas == 1 
      "#{tarefas} tarefa alocada"
    else
      "#{tarefas} tarefas alocadas"
    end
  end

  def horas_trabalhadas
    horas = self.user.tasks.sum(:hours, :conditions => 
                                        ["sprint_id = ? and status = 'Pronto'",self.sprint_id])
    if horas.blank?
      "0 horas trabalhadas"
    else
      if horas == 1 
        "#{horas} hora trabalhada"
      else
        "#{horas} horas trabalhadas"
      end
    end
  end
end
