class Event < ApplicationRecord 
  belongs_to :organizer, class_name: 'User', foreign_key: 'organizer_id'
  has_many :event_users, class_name: 'EventUser',dependent: :destroy
  has_many :users, class_name: 'User', through: :event_users

  validates :name, presence: true, length: { maximum: 15 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :date, presence: true
  validates :location, presence: true
  validates :organizer, presence: true
end