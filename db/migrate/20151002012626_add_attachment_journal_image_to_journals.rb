class AddAttachmentJournalImageToJournals < ActiveRecord::Migration
  def self.up
    change_table :journals do |t|
      t.attachment :journal_image
    end
  end

  def self.down
    remove_attachment :journals, :journal_image
  end
end
