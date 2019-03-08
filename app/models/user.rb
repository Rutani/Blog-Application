class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,authentication_keys: [:username]
 	has_many :blogs , dependent: :destroy
 	has_many :comments, dependent: :destroy


 	after_create :welcome_send
 	def welcome_send
 		WelcomeMailer.welcome_send(self).deliver
 	end
end
