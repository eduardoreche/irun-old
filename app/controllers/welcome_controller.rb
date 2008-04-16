class WelcomeController < ApplicationController
  
  skip_before_filter :authenticate
  
  def index
    
    @sprint = Sprint.find(:first,
                          :conditions => "active is true")
    
  end
end
