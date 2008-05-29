module SprintsHelper
  
  def concluded_label(value)
    color = '#73a25a' if value <= 90 and value == 100
    color = '#5a7dd6' if value >= 80 and value < 90
    color = '#efe708' if value >= 60 and value < 80
    color = '#efba29' if value >= 20 and value < 60
    color = '#ce494a' if value <= 20
    
     "<font style='color:#{color};font-weight:bold'>#{value}%</font>"
  end
  
end
