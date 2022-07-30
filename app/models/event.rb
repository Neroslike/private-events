class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :event_attendees, dependent: :destroy
  has_many :attendees, through: :event_attendees, source: :user

  scope :past, -> { where('date < ?', Time.current) }
  scope :upcoming, -> { where('date > ?', Time.current) }
end
