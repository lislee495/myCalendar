class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friendships
  has_many :friends, through: :friendships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def upcoming_events

  end

  def next_upcoming_event

  end
end
