class User < ActiveRecord::Base
  attr_accessible :admin, :email, :fname, :lname, :birthday
  has_many :Attendees
  has_many :Meetings, :through => :Attendees
  has_many :Meetings

  validates :fname, :lname, :watiam, :presence => true
  validates :watiam, :uniqueness => true


  def name
    fname + " " + lname
  end



end
