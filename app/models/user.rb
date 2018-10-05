class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :birthday, :quote, :about, :username, :email, :adventurer_type, presence: true
  validates :email, :username, uniqueness: { case_sensitive: false}
  validates :password, length: {minimum: 6}
  has_many :avatars, dependent: :destroy
  has_many :adventures, dependent: :destroy
  has_many :posts, dependent: :destroy
  before_create :downcase_email, :capitalize_name, :downcase_username, :prepend_username


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

  def downcase_username
    username.downcase!
  end

  def prepend_username
    username.prepend("@")
  end

  def capitalize_name
  	first_name.capitalize! && last_name.capitalize!
  end

end
