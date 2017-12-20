class Event < ActiveRecord::Base
  has_many :users
  belongs_to :owner, class: "User", foreign_key: "owner_id"
  has_many :categories, through: :event_categories
  has_many :event_categories
  validates :short_description, presence: true, length: {maximum: 140}
  validates :category, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :additional_info, length: {maximum: 280}

  def self.upcoming_events
    where("created_at >=?", Time.zone.today.beginning_of_day).order(date: :desc)
  end

  def self.previous_events
    where("created_at <?", Time.zone.today.beginning_of_day)
  end

  def self.next_upcoming_event
    self.upcoming_events.limit(1)
  end

end
