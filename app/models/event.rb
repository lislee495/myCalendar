class Event < ActiveRecord::Base
  has_many :users
  belongs_to :owner, class: "User", foreign_key: "owner_id"
  has_many :categories, through: :event_categories
  has_many :event_categories
  validates :category, presence: true
  validates :date, presence: true
  validates :time, presence: true



end
