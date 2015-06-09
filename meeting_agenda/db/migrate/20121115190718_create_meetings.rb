class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :owner
      t.string :date
      t.string :place
      t.string :time
      t.text :description

      t.timestamps
    end
  end
end
