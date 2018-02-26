class User < ApplicationRecord


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :leagues_members
   has_many :leagues, through: :leagues_members
   # has_many :matches
   #has_many :leagues, through: :matches

end
