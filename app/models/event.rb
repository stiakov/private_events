class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id'
  has_many :attendees, through: :attendances, source: :attendee

  default_scope -> { order(date_event: :asc) }
  scope :past_event, -> {where('date_event < ?',  DateTime.current) }
  scope :upcoming_event, -> {where('date_event >= ?', DateTime.current) }

end
