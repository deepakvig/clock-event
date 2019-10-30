require 'rails_helper'

RSpec.describe TrackEvent, type: :model do
  it "is not valid without a time in" do
    track_event = TrackEvent.new(time_in: nil)
    expect(track_event).to_not be_valid
  end

  it "is valid with valid attributes" do
    user = create(:user)
    expect(TrackEvent.new(time_in: Time.now, user_id: user.id)).to be_valid
  end

  it "is invalid if time in greater thans time out attribute" do
    user = create(:user)
    expect(TrackEvent.new(time_in: Time.now, time_out: Time.now-10.days, user_id: user.id)).not_to be_valid
  end
end
