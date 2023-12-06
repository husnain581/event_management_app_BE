class User < ApplicationRecord
  has_many :events, foreign_key: :organizer_id, dependent: :destroy
  has_many :event_users

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self         
end
