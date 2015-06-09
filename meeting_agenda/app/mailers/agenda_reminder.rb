class AgendaReminder < ActionMailer::Base
  default from: "from@example.com"
  
  def reminder_email(user, meeting)
    @user = user
    @meeting = meeting
    @url = "http://www.reddit.com"
    mail(:to => @user.email, :subject => "Agenda Items Reminder")
  end
end
