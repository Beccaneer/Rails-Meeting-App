class AddEndToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :end, :string
  end
end
