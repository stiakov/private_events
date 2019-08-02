class User < ApplicationRecord
  has_many :events, :foreign_key => :creator_id
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :attended_event
  has_many :invitations, through: :invitations, source: :invited_events_id
  before_save {self.email = email.downcase}
  validates :email, presence: :true, uniqueness: :true
end