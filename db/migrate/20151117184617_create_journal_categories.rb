class CreateJournalCategories < ActiveRecord::Migration
  def change
    create_table :journal_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
