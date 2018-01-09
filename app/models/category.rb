class Category < ActiveRecord::Base
  has_many :event_categories
  has_many :events, through: :event_categories
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

end
