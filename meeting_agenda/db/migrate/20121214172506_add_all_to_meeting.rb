class AddAllToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :all, :boolean
  end
end
