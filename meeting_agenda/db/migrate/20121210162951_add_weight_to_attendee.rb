class AddWeightToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :weight, :integer
  end
end
