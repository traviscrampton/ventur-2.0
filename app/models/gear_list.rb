class GearList < ActiveRecord::Base
  belongs_to :journal
  belongs_to :user
  has_many :gear_items, dependent: :destroy

  validates :title, presence: true, length: { maximum: 30}
end
