class AddMeetingIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :meeting_id, :integer
  end
end
