class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128
  has_many :journals, dependent: :destroy

  has_attached_file :profile, 
  	styles: { 
  		large: "600x600>", 
  		medium: "300x300#", 
  		thumb: "150x150#" }, 
  		default_url: "profile_img_default.png"
  		storage: :s3,
    	s3_credentials: "#{Rails.root}/config/s3.yml"
  validates_attachment_content_type :profile, 
  	content_type: /\Aimage\/.*\Z/
end
