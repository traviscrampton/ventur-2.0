class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 6..128
  has_many :journals, dependent: :destroy
  has_many :gear_lists, dependent: :destroy

  has_attached_file :profile, 
  	styles: { 
  		large: "600x600>", 
  		medium: "300x300#", 
  		thumb: "150x150#" }, 
  		default_url: "knapsack_logo.png"

  validates_attachment_content_type :profile, 
  	content_type: /\Aimage\/.*\Z/
end
