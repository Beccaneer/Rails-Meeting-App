class Attendee < ActiveRecord::Base
  attr_accessible :user_id, :meeting_id
  belongs_to :User
  belongs_to :Meeting

end
