class Portfolio < ActiveRecord::Base

	mount_uploader :image, PortfolioImageUploader

	validates :category, :presence => true
	validates :title, :presence => true
	validates :context, :presence => true
	validates :date, :presence => true
	validates :service, :presence => true

end
