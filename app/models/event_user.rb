class EventUser < ApplicationRecord 
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id', optional: true
end
