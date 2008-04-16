# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_filter :authenticate

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'eddbe0aad7b5ffabb6c8f27ff4f3495e'
  
  def authenticate
    unless session[:user]
      authenticate_or_request_with_http_basic do |name, pass|
        @user = User.find_by_email_and_password(name,pass)
        session[:user] = @user
      end
    end
  end
end
