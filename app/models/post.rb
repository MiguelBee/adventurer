class Post < ApplicationRecord
	mount_uploader :picture, PictureUploader
	belongs_to :user
	belongs_to :adventure
	validates :title, presence: true

	#self.inheritance_column = :post_type

	def self.types
		%w(TravelVideo TravelPicture TravelLog)
	end

	scope :travel_video, -> {where(post_type: 'TravelVideo')}
	scope :travel_picture, -> {where(post_type: 'TravelPicture')}
	scope :travel_log, -> {where(post_type: 'TravelLog')}
end