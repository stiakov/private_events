class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :attended_event
  has_many :invitations, foreign_key: 'guest_id'
  has_many :invited_events, through: :invitations, source: :invited_event
  before_save {self.email = email.downcase}
  validates :email, presence: :true, uniqueness: :true
end