class Adventure < ApplicationRecord
belongs_to :user
has_many :posts, dependent: :destroy
validates :title, :description, presence: true

delegate :travel_picture, :travel_video, :travel_log, to: :posts

	#def to_param
	#	"#{id}-#{title}"
	#end

end