class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :leagues_members
   has_many :leagues, through: :leagues_members
   has_many :owned_leagues, class_name: 'League', foreign_key: 'owner_id'
end
