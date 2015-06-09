class AddBoxToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :reminders, :boolean
  end
end
