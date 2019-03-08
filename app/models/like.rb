class Like < ApplicationRecord
  has_many :notification, as: :notifiable, dependent: :destroy
  belongs_to :user
  belongs_to :blog
end
