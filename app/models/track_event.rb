class TrackEvent < ApplicationRecord
  belongs_to :user

  scope :in_range, -> range {
    where('(time_in BETWEEN ? AND ?) OR (time_out BETWEEN ? AND ?)', range.first, range.last, range.first, range.last)
  }
  scope :exclude_self, -> id { where.not(id: id) }

  validates_presence_of :time_in, message: 'Log should be present first!', on: :create
  validate :last_event_completed, on: :create
  validate :valid_times
  validate :cannot_overlap_another_event, if: -> { self.user }

  def last_event_completed
    errors.add(:punch_out, 'or Update Out Time to complete previous TimeLog first!') if self.user && !self.user.last_event_completed?
  end

  def valid_times
    if time_in && time_out && time_in > time_out
      self.errors.add :time_in, ' has to be before time out'
    end
  end

  def cannot_overlap_another_event
    return unless errors.blank?
    in_time = self.time_in || Time.now - 100.years
    out_time = self.time_out || Time.now + 100.years
    range = Range.new in_time, out_time 

    overlaps = self.user.track_events.exclude_self(id).in_range(range)
    overlap_error unless overlaps.empty?
  end

  def overlap_error
    errors.add(:overlap_error, 'There is already a TimeLog prevent in this hour!')
  end

  def complete?
    !self.time_out.blank?
  end

  def assign_time_in
    self.time_in = Time.now
  end

  def assign_time_out
    self.time_out = Time.now
  end

  def assign_time(val='Punch In!')
    if val == 'Punch Out!'
      if self.user && !self.user.last_event_completed?
        event = self.user.last_event
        event.assign_time_out
        return event
      end
    else
      self.assign_time_in
    end
    return self
  end
end
