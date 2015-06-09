class Discussion < ActiveRecord::Base
  attr_accessible :item
  belongs_to :User
  belongs_to :Meeting

end
