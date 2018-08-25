class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validates :first_name, :last_name, :birthday, :quote, presence: true
  #validates :email, uniqueness: { message: "Email already exists."}

  def to_param
  	"#{id}-#{first_name}-#{last_name}"
  end

end
