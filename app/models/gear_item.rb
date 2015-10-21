class GearItem < ActiveRecord::Base
  belongs_to :gear_list
  validates :item_name, presence: true, length: { maximum: 30}
end