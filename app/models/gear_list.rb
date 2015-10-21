class GearList < ActiveRecord::Base
  belongs_to :journal
  belongs_to :user
  has_many :gear_items

<<<<<<< HEAD
  validates :title, presence: true, length: { maximum: 30 }
=======
  validates :title, presence: true, length: { maximum: 30}
>>>>>>> gear-list
end
