class GearList < ActiveRecord::Base
  belongs_to :journal
  belongs_to :user
end
