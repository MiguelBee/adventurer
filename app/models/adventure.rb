class Adventure < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :votes, dependent: :destroy
  validates :title, :description, presence: true

  delegate :travel_picture, :travel_video, :travel_log, to: :posts
end
