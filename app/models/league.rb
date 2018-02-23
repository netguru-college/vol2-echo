class League < ApplicationRecord
  has_many :leagues_members
  has_many :users, through: :leagues_members
end
