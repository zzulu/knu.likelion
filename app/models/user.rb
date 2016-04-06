class User < ActiveRecord::Base

  mount_uploader :profile, ProfileUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :posts
  has_many :playgrounds
  has_many :ideas
  has_many :scraps
  has_many :comments

end
