class AddUserIdToGearList < ActiveRecord::Migration
  def change
    add_column :gear_lists, :user_id, :integer
  end
end
