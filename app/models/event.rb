class Event < ApplicationRecord 
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :event_users, class_name: 'EventUser',dependent: :destroy
  has_many :users, class_name: 'User', through: :event_users
end