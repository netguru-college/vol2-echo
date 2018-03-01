class Comment < ApplicationRecord
  validates :title, presence: true
  validates :message, presence: true
  belongs_to :author, class_name: 'User'
  belongs_to :profile, class_name: 'User'
end
