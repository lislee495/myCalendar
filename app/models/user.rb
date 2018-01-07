class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friendships
  has_many :event_users
  has_many :events, through: :event_users
  has_many :friends, through: :friendships
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable,
        :validatable
  accepts_nested_attributes_for :events, :friendships
end
