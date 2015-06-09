class AddItemToMeeting < ActiveRecord::Migration
  def change
    add_column :meetings, :item, :text
  end
end
