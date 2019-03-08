class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  belongs_to :notifiable , polymorphic: true
end
