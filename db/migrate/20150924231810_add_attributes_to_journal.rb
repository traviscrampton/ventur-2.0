class AddAttributesToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :title, :string
    add_column :journals, :description, :text
  end
end
