class Post < ApplicationRecord
	acts_as_taggable
	belongs_to :user
	belongs_to :adventure
	has_many :votes, dependent: :destroy	
	validates :title, presence: true
	before_save :capitalize_title

	self.inheritance_column = :post_type

	def self.post_types
		%w(TravelVideo TravelPicture TravelLog)
	end

	def capitalize_title
		title.capitalize!
	end

	scope :travel_video, -> {where(post_type: 'TravelVideo')}
	scope :travel_picture, -> {where(post_type: 'TravelPicture')}
	scope :travel_log, -> {where(post_type: 'TravelLog')}
end