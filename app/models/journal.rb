class Journal < ActiveRecord::Base
	belongs_to :user
	belongs_to :journal_category
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 50 }
 	validates :description, presence: true, length: { maximum: 200 }

	has_attached_file :journal_image,
	styles: { 
		large: "600x600>", 
		medium: "550x550#", 
		thumb: "150x150#" }

  validates_attachment_content_type :journal_image,
  	content_type: /\Aimage\/.*\Z/
end
