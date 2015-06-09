class ApplicationController < ActionController::Base
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :is_user, :except => :notauth
  protect_from_forgery

  def is_user
	return true if !User.find_by_watiam(session[:cas_user]).nil?
	redirect_to home_notauth_url and return false
  end

end
