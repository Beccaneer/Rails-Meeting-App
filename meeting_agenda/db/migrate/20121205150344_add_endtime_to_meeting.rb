class AddEndtimeToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :endtime, :string
  end
end
