class User < ApplicationRecord
  has_many :events, :foreign_key => :creator_id
  has_many :attended_events, through: :attendance, source: :attended_event_id
  has_many :attendances, foreign_key: 'attendee_id'
  before_save {self.email = email.downcase}
  validates :email, presence: :true, uniqueness: :true
end