class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :event_categories
  has_many :categories, through: :event_categories
  accepts_nested_attributes_for :categories
  validates :short_description, presence: true, length: {maximum: 140}
  validates :date, presence: true
  validates :time, presence: true
  validates :additional_info, length: {maximum: 280}

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(name: category_attribute)
      self.categories << category
    end
  end
  #
  # def upcoming_events(num = nil)
  #   if num
  #     where("date >=? AND owner_id =?", Time.zone.today.beginning_of_day).order(date: :asc).limit(num)
  #   else
  #     where("date >=? AND users =?", Time.zone.today.beginning_of_day, 2).order(date: :asc)
  #   end
  # end
  #
  #
  # def self.previous_events
  #   where("date <?", Time.zone.today.beginning_of_day).order(date: :desc).limit(5)
  # end
  #
  # def self.next_upcoming_event
  #   self.upcoming_events.limit(1)
  # end

end
