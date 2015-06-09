class MyNewMigration < ActiveRecord::Migration
  def up
	rename_column :meetings, :owner, :user_id
	change_column :meetings, :user_id, :integer
	change_column :meetings, :date, :datetime
	change_column :meetings, :time, :datetime
	change_column :meetings, :endtime, :datetime  

  end

  def down
  end
end
