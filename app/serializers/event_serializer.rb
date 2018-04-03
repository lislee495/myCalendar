class EventSerializer < ActiveModel::Serializer
  attributes :id, :short_description, :date, :end_time, :start_time, :additional_info, :user_ids
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :categories
end
