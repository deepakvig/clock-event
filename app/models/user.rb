class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true

  has_many :track_events, -> { order(time_in: :desc) }

  def last_event_completed?
    self.track_events.blank? || self.track_events.first.complete?
  end

  def last_event
    self.track_events.first
  end
end
