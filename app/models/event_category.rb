class EventCategory < ActiveRecord
  belongs_to :event
  belongs_to :category
end 
