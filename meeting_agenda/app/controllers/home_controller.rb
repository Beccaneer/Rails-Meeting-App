class HomeController < ApplicationController
  def index
 	@user = User.find_by_watiam(session[:cas_user])
  
  @userattendees = Attendee.where(:user_id => @user.id).all
  @usermeetings = []
  @userattendees.each do |attendee|
    @meeting = Meeting.find(:first, :conditions => {:id => attendee.meeting_id})
    @usermeetings << @meeting
  end

  end

  
  
  def notauth
  end

end
