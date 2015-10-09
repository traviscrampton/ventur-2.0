class GearList < ActiveRecord::Base
  belongs_to :journal
  belongs_to :user
  has_many :gear_items
end
