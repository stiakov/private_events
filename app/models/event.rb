class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances, source: :attendee
  has_many :invitations, foreign_key: 'invited_event_id'
  has_many :guests, through: :invitations, source: :guest_id

  validates :title, presence: :true, length: { minimum: 5 }
  validates :place, presence: :true, length: { minimum: 5 }
  validates :description, presence: :true, length: { minimum: 10 }

  scope :past_event, -> { where('date_event < ?',  Time.current).order(date_event: :DESC) }
  scope :upcoming_event, -> { where('date_event >= ?', Time.current) }

end
