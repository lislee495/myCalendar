class EventUser < ActiveRecord
  belongs_to :event
  belongs_to :user
end
