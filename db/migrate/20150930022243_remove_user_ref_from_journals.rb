class RemoveUserRefFromJournals < ActiveRecord::Migration
  def change
    remove_reference :journals, :user, index: true, foreign_key: true
  end
end
