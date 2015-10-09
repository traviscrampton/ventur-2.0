class CreateGearLists < ActiveRecord::Migration
  def change
    create_table :gear_lists do |t|
      t.string :title
      t.references :journal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
