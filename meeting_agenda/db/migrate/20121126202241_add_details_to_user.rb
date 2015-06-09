class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :watiam, :string
  end
end
