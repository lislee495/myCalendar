class Event < ActiveRecord::Base
  has_many :event_users
  has_many :users, through: :event_users
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :event_categories
  has_many :categories, through: :event_categories
  accepts_nested_attributes_for :categories, reject_if: proc { |attributes| attributes['name'].blank? }
  validates :short_description, presence: true, length: {maximum: 140}
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :additional_info, length: {maximum: 280}


  def categories_attributes=(category_attributes)
    if category_attributes[:name] != ""
      category = Category.find_by(name: category_attributes[:name], owner_id: category_attributes[:owner_id])
      if !category
        category = Category.create(name: category_attributes[:name], owner_id: category_attributes[:owner_id])
      end
      self.categories << category
    end
  end
end
