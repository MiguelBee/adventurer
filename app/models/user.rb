class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :birthday, :quote, presence: true
  validates :email, uniqueness: { case_sensitive: false}
  has_many :avatars
  has_many :adventures
  before_save :downcase_email
  before_save :capitalize_name

  def to_param
  	"#{id}-#{first_name}-#{last_name}"
  end

  def full_name
  	"#{first_name} 	#{last_name}"
  end

  def age
  	((Time.zone.now - birthday.to_time) / 1.year.seconds).floor
  end

  def downcase_email
  	email.downcase!
  end

  def capitalize_name
  	first_name.capitalize! && last_name.capitalize!
  end

end
