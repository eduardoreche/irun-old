class WelcomeController < ApplicationController
  
  skip_before_filter :authenticate
  
  def index
    
    @sprint = Sprint.find(:first,
                          :conditions => "active is true")
                          
#    @products = Product.find_by_sql("select distinct p.*
#                                      from products p
#                                        inner join backlog_items b on p.id = b.product_id 
#                                        inner join tasks t on t.backlog_item_id = b.id 
#                                        inner join sprints s on s.id = t.sprint_id 
#                                      where s.active is true")
    
  end
end
