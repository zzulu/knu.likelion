class Post < ActiveRecord::Base

	belongs_to :user

	has_many :replies

	validates :title, :presence => true
	# validates :sub_title, :presence => true
	validates :context, :presence => true

end
