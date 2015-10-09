class CreateGearItems < ActiveRecord::Migration
  def change
    create_table :gear_items do |t|
      t.string :item_name
      t.references :gear_list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
