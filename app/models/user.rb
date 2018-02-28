class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :leagues_members
  has_many :leagues, through: :leagues_members
  has_many :owned_leagues, class_name: 'League', foreign_key: 'owner_id'
  
  has_many :profile_comments, class_name: 'Comment', foreign_key: 'profile_id'
  has_many :written_comments, class_name: 'Comment', foreign_key: 'author_id'
end
