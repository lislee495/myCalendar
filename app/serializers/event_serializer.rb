class EventSerializer < ActiveModel::Serializer
  attributes :id, :short_description, :date, :end_time, :start_time, :additional_info, :user_ids
end
