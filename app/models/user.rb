class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :adverts
  has_many :projects
  after_create :welcome_send
  validates :first_name, :last_name, presence: true, on: :create
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
