class Meeting < ActiveRecord::Base
  attr_accessible :date, :description, :user_id, :place, :time, :endtime, :title, :reminders, :item
  has_many :Attendees
  has_many :Users, :through => :Attendees
  belongs_to :Users
  

end
