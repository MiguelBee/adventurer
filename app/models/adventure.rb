class Adventure < ApplicationRecord
belongs_to :user
validates :title, :description, presence: true
end

def to_param
	"#{title}"
end