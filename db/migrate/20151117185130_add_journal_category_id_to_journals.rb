class AddJournalCategoryIdToJournals < ActiveRecord::Migration
  def change
    add_column :journals, :journal_category_id, :integer
  end
end
